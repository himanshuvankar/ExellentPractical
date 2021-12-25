//
//  MovieDetailsVC.swift
//  ExellentPractial
//
//  Created by imobdev on 25/12/21.
//

import UIKit
import Alamofire
class MovieDetailsVC: UIViewController {

    //MARK: - Outlets
    @IBOutlet weak var tblView: UITableView!
    //MARK: - Variables
    var movie_id = ""
    var moviesDetails : MovieDetailModel?
    var movieList : [MovieDetailModel] = []
    var DetailsData : [Details_Data] = []
    var genres = [Genres]()
    var productionCompanies = [Production_companies]()
    var language = [Spoken_languages]()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Movie Details"
        setupView()
    }
    private func setupView(){
        self.tblView.delegate = self
        self.tblView.dataSource = self
        GetMoviesDetails()
    }
    
}
//MARK: - API Calling
extension MovieDetailsVC{
    fileprivate func GetMoviesDetails(){
        //check connectivity
        if !Connectivity.isConnectedToInternet {//Not connect
            //No Internet connection
            showAlert(message: "Network Error", title: "Unable to connect the server")
            return
        }
        let url = "https://api.themoviedb.org/3/movie/\(movie_id)?api_key=14bc774791d9d20b3a138bb6e26e2579&language=en-US"
        print(url)
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
//                    let result = dictData?.object(forKey: "results") as? NSArray
                    if dictData != nil{
                        self.moviesDetails = MovieDetailModel.init(dictionary: dictData!)
                        self.movieList.append(MovieDetailModel.init(dictionary: dictData!)!)
                    }
                    
                    self.DetailsData.append(Details_Data.init(ttl: "Overview", vle: self.moviesDetails?.overview ?? ""))
                    var gen = ""
                    self.genres = (self.moviesDetails?.genres)!
                    self.productionCompanies = (self.moviesDetails?.production_companies)!
                    for i in self.genres{
                        if gen == ""{
                            gen = i.name!
                        }else{
                            gen = gen + ", " + i.name!
                        }
                    }
                    self.DetailsData.append(Details_Data.init(ttl: "Genres", vle: gen))
                    self.DetailsData.append(Details_Data.init(ttl: "Duration", vle: "\(self.moviesDetails?.runtime ?? 0)Mins"))
//                    let strt = self.productionCompanies.map{ (a) -> String in return ", \(a)"}
//                    print(strt)
                    self.DetailsData.append(Details_Data.init(ttl: "Release Date", vle: self.moviesDetails?.release_date ?? ""))
                    gen = ""
                    for i in self.productionCompanies{
                        if gen == ""{
                            gen = i.name!
                        }else{
                            gen = gen + ", " + i.name!
                        }
                    }
                    self.DetailsData.append(Details_Data.init(ttl: "Production Budget", vle: gen))
                    self.DetailsData.append(Details_Data.init(ttl: "release_date", vle: "$\(self.moviesDetails?.budget ?? 0)"))
                    self.DetailsData.append(Details_Data.init(ttl: "Revenue", vle: "$\(self.moviesDetails?.revenue ?? 0)"))
                    gen = ""
                    for i in self.language{
                        if gen == ""{
                            gen = i.name!
                        }else{
                            gen = gen + ", " + i.name!
                        }
                    }
                    self.DetailsData.append(Details_Data.init(ttl: "Language", vle: gen))
                    
                    // Save Data into CoreData
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
extension MovieDetailsVC : UITableViewDelegate,UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 10
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0{
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "MoviesDetailsCell", for: indexPath) as? MoviesDetailsCell else {return UITableViewCell()}
            let row = self.moviesDetails
            cell.imgLargePoster.sd_setImage(with: URL(string: AppURL.imageBaseURL + (row?.belongs_to_collection?.poster_path ?? "")), placeholderImage: #imageLiteral(resourceName: GlobalConstants.PlaceHolderImageName))
            cell.imgPoster.sd_setImage(with: URL(string: AppURL.imageBaseURL + (row?.belongs_to_collection?.poster_path ?? "")), placeholderImage: #imageLiteral(resourceName: GlobalConstants.PlaceHolderImageName))
            cell.lblTitle.text = row?.title ?? ""
            cell.lblDescripiton.text = row?.tagline ?? ""
            cell.TransparentBGView.layer.backgroundColor = UIColor.clear.withAlphaComponent(0.25).cgColor
            cell.backgroundColor = .clear
            cell.selectionStyle = .none
            return cell
        }
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MoviePosterCell", for: indexPath) as? MoviePosterCell else {return UITableViewCell()}
        let row = self.moviesDetails
//        cell.lblTitle.text =
        
        cell.backgroundColor = .clear
        cell.selectionStyle = .none
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0{
            return 300
        }
        return tableView.estimatedRowHeight
    }
}
struct Details_Data{
    var  title : String?
    var value : String?
    init(ttl:String,vle: String){
        title = ttl
        value = vle
    }
}
struct TOS<T> {
   var items = [T]()
    var Title : String?
    mutating func push(title:String,item: T) {
        Title = title
      items.append(item)
   }
   mutating func pop() -> T {
      return items.removeLast()
   }
}
