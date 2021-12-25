//
//  ViewController.swift
//  ExellentPractial
//
//  Created by imobdev on 25/12/21.
//

import UIKit
import Alamofire
import CoreData
import SDWebImage
class MoviesListVC: UIViewController {
    //MARK: - Outlets
    @IBOutlet weak var tblView: UITableView!
    //MARK: - variables
    var MoviesData : [MoviesListResults] = []
    var page = 1
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupView()
    }
    //MARK: - Local Methods
    private func setupView(){
        GetMoviewList()
        tblView.register(UINib.init(nibName: "MovieListCell", bundle: nil), forCellReuseIdentifier: "MovieListCell")
        self.title = "Movies List"
        self.tblView.delegate = self
        self.tblView.dataSource = self
//        RetrvieData()
    }
    //MARK - Insert Data into coredata
    private func saveData(){
        guard let userEntity = NSEntityDescription.entity(forEntityName: TableName.MoviesList, in: contextManaged) else { return }
        for i in self.MoviesData{
            let user = NSManagedObject(entity: userEntity, insertInto: contextManaged)
            user.setValue(i.adult, forKey: AppApiKeys.adult)
            user.setValue(i.backdrop_path, forKey: AppApiKeys.backdrop_path)
            user.setValue(i.id, forKey: AppApiKeys.id)
            user.setValue(i.original_language ?? "", forKey: AppApiKeys.original_language)
            user.setValue(i.original_title, forKey: AppApiKeys.original_title)
            user.setValue(i.overview, forKey: AppApiKeys.overview)
            user.setValue(i.popularity, forKey: AppApiKeys.popularity)
            user.setValue(i.poster_path, forKey: AppApiKeys.poster_path)
            user.setValue(i.release_date, forKey: AppApiKeys.release_date)
            user.setValue(i.title, forKey: AppApiKeys.title)
            user.setValue(i.video, forKey: AppApiKeys.video)
            user.setValue(i.vote_average, forKey: AppApiKeys.vote_average)
            user.setValue(i.vote_count, forKey: AppApiKeys.vote_count)
        }
        do{
            try contextManaged.save()
        }catch let err{
            print(err.localizedDescription)
        }
        
    }
    private func RetrvieData(){
        let fetchData = NSFetchRequest<NSFetchRequestResult>(entityName: TableName.MoviesList)
        do{
            let result = try contextManaged.fetch(fetchData)
            if result is [NSManagedObject]{
                for i in result as! [NSManagedObject]{
                    let adult = i.value(forKey: AppApiKeys.adult) as? Bool ?? false
                    let backdrop_path = i.value(forKey: AppApiKeys.backdrop_path) as? String ?? ""
                    let id = i.value(forKey: AppApiKeys.id) as? Int ?? 0
                    print("dictData.count",id)
                    let original_language = i.value(forKey: AppApiKeys.original_language) as? String ?? ""
                    let original_title = i.value(forKey: AppApiKeys.original_title) as? String ?? ""
                    let overview = i.value(forKey: AppApiKeys.overview) as? String ?? ""
                    let popularity = i.value(forKey: AppApiKeys.popularity) as? Double ?? 0.00
                    
                    let poster_path = i.value(forKey: AppApiKeys.poster_path) as? String ?? ""
                    let release_date = i.value(forKey: AppApiKeys.release_date) as? String ?? ""
                    let video = i.value(forKey: AppApiKeys.video) as? Bool ?? false
                    let vote_average = i.value(forKey: AppApiKeys.vote_average) as? Double ?? 0.00
                    let vote_count = i.value(forKey: AppApiKeys.vote_count) as? Int ?? 0
                    
                    var dict = [String : Any]()
                    dict.updateValue(adult, forKey: AppApiKeys.adult)
                    dict.updateValue(backdrop_path, forKey: AppApiKeys.backdrop_path)
                    dict.updateValue(id, forKey: AppApiKeys.id)
                    dict.updateValue(original_language, forKey: AppApiKeys.original_language)
                    dict.updateValue(original_title, forKey: AppApiKeys.original_title)
                    dict.updateValue(overview, forKey: AppApiKeys.overview)
                    dict.updateValue(popularity, forKey: AppApiKeys.popularity)
                    dict.updateValue(poster_path, forKey: AppApiKeys.poster_path)
                    dict.updateValue(release_date, forKey: AppApiKeys.release_date)
                    dict.updateValue(video, forKey: AppApiKeys.video)
                    dict.updateValue(vote_count, forKey: AppApiKeys.vote_count)
                    dict.updateValue(vote_average, forKey: AppApiKeys.vote_average)
                    let dictData = dict as NSDictionary
                    print("dictData.count",dictData.count)
                    self.MoviesData.append((MoviesListResults.init(dictionary: dictData) ?? MoviesListResults(dictionary: NSDictionary()))!)
                }
//                for i in self.MoviesData{
//                    print("\(i.id) \(i.title)")
//                }
                
                self.tblView.reloadData()
            }
//
        }catch let err{
            print(err.localizedDescription)
        }
    }
}
//MARK: - API Calling
extension MoviesListVC{
    fileprivate func GetMoviewList(){
        //check connectivity
        if !Connectivity.isConnectedToInternet {//Not connect
            //No Internet connection
            showAlert(message: "Network Error", title: "Unable to connect the server")
            return
        }
        let url = "https://api.themoviedb.org/3/discover/movie?api_key=14bc774791d9d20b3a138bb6e26e2579&language=en-US&page=\(page)" //"\(AppURL.BaseURL)?api_key=\(GlobalConstants.APIKEY_Value)&language=\(GlobalConstants.SelectedLanguage)&page=1"
        var dictData = [String : Any]()
        dictData.updateValue(GlobalConstants.APIKEY_Value, forKey: AppApiKeys.apikey)
        dictData.updateValue(GlobalConstants.SelectedLanguage, forKey: AppApiKeys.language)
        
        AF.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseJSON { response in
            switch(response.result) {
            case .success(_):
                print(response.value)
                if (response.value != nil)
                {
                    let dictData = response.value as? NSDictionary
                    let result = dictData?.object(forKey: "results") as? NSArray
                    if result != nil{
//                        self.MoviesData = MoviesListResults.modelsFromDictionaryArray(array: result!)
                        self.MoviesData.append(contentsOf: MoviesListResults.modelsFromDictionaryArray(array: result!))
                    }
                    print("reading ",self.MoviesData.count)
                    // Save Data into CoreData
//                    self.saveData()
                    self.tblView.reloadData()
                }
                break
                
            case .failure(let error):
                
                print(error.localizedDescription)
                break
            }
        }
    }
}
//MARK: - TableView Delegates
extension MoviesListVC : UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.MoviesData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MovieListCell", for: indexPath) as? MovieListCell else {return UITableViewCell()}
        let row = self.MoviesData[indexPath.row]
        cell.imgVIew.sd_setImage(with: URL(string: AppURL.imageBaseURL + (row.poster_path ?? "")), placeholderImage: #imageLiteral(resourceName: GlobalConstants.PlaceHolderImageName))
        cell.lblDate.text = row.release_date ?? ""
        cell.lblName.text = row.original_title ?? ""
        cell.lblDescripiton.text = row.overview ?? ""
        cell.backgroundColor = .clear
        cell.selectionStyle = .none
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let row = self.MoviesData[indexPath.row]
        print(row.title)
//        let vc = self.storyboard?.instantiateViewController(withIdentifier: "MovieDetailsVC") as! MovieDetailsVC
//        vc.movie_id = "\(row.id ?? 0)"
//        self.navigationController?.pushViewController(vc, animated: true)
        print("did select pressed")
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyBoard.instantiateViewController(withIdentifier: "MovieDetailsVC") as! MovieDetailsVC
        viewController.movie_id = "\(row.id ?? 0)"
        self.navigationController?.pushViewController(viewController, animated: false)
    }
    
}
//MARK:- load more
extension MoviesListVC : UIScrollViewDelegate {
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        
        let footerHight : CGFloat = 50.0
        let frame = CGRect(x: 0, y: 0, width: self.tblView.frame.size.width, height: footerHight)
        
        let offset = scrollView.contentOffset;
        let bounds = scrollView.bounds;
        let size = scrollView.contentSize;
        let inset = scrollView.contentInset;
        let y = offset.y + bounds.size.height - inset.bottom;
        let h = size.height;
        let reload_distance : CGFloat = 20.0;
        if(y > h + reload_distance)
        {
            
            NSLog("load more rows");
            page = page + 1
            self.GetMoviewList()
        }
    }
}
