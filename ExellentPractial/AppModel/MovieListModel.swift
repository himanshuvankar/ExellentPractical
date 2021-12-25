/* 
Copyright (c) 2021 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
public class MovieListModel {
    public var page : Int?
    public var results : Array<MoviesListResults>?
    public var total_pages : Int?
    public var total_results : Int?

/**
    Returns an array of models based on given dictionary.
    
    Sample usage:
    let json4Swift_Base_list = Json4Swift_Base.modelsFromDictionaryArray(someDictionaryArrayFromJSON)

    - parameter array:  NSArray from JSON dictionary.

    - returns: Array of Json4Swift_Base Instances.
*/
    public class func modelsFromDictionaryArray(array:NSArray) -> [MovieListModel]
    {
        var models:[MovieListModel] = []
        for item in array
        {
            models.append(MovieListModel(dictionary: item as! NSDictionary)!)
        }
        return models
    }

/**
    Constructs the object based on the given dictionary.
    
    Sample usage:
    let json4Swift_Base = Json4Swift_Base(someDictionaryFromJSON)

    - parameter dictionary:  NSDictionary from JSON.

    - returns: Json4Swift_Base Instance.
*/
    required public init?(dictionary: NSDictionary) {

        page = dictionary["page"] as? Int
        if (dictionary["results"] != nil) { results = MoviesListResults.modelsFromDictionaryArray(array: dictionary["results"] as! NSArray) }
        total_pages = dictionary["total_pages"] as? Int
        total_results = dictionary["total_results"] as? Int
    }

        
/**
    Returns the dictionary representation for the current instance.
    
    - returns: NSDictionary.
*/
    public func dictionaryRepresentation() -> NSDictionary {

        let dictionary = NSMutableDictionary()

        dictionary.setValue(self.page, forKey: "page")
        dictionary.setValue(self.total_pages, forKey: "total_pages")
        dictionary.setValue(self.total_results, forKey: "total_results")

        return dictionary
    }

}
public class MoviesListResults {
    public var adult : Bool?
    public var backdrop_path : String?
    public var genre_ids : Array<Int>?
    public var id : Int?
    public var original_language : String?
    public var original_title : String?
    public var overview : String?
    public var popularity : Double?
    public var poster_path : String?
    public var release_date : String?
    public var title : String?
    public var video : Bool?
    public var vote_average : Double?
    public var vote_count : Int?

/**
    Returns an array of models based on given dictionary.
    
    Sample usage:
    let results_list = Results.modelsFromDictionaryArray(someDictionaryArrayFromJSON)

    - parameter array:  NSArray from JSON dictionary.

    - returns: Array of Results Instances.
*/
    public class func modelsFromDictionaryArray(array:NSArray) -> [MoviesListResults]
    {
        var models:[MoviesListResults] = []
        for item in array
        {
            models.append(MoviesListResults(dictionary: item as! NSDictionary)!)
        }
        return models
    }

/**
    Constructs the object based on the given dictionary.
    
    Sample usage:
    let results = Results(someDictionaryFromJSON)

    - parameter dictionary:  NSDictionary from JSON.

    - returns: Results Instance.
*/
    required public init?(dictionary: NSDictionary) {

        adult = dictionary["adult"] as? Bool
        backdrop_path = dictionary["backdrop_path"] as? String
//        if (dictionary["genre_ids"] != nil) { genre_ids = Genre_ids.modelsFromDictionaryArray(dictionary["genre_ids"] as! NSArray) }
        id = dictionary["id"] as? Int
        original_language = dictionary["original_language"] as? String
        original_title = dictionary["original_title"] as? String
        overview = dictionary["overview"] as? String
        popularity = dictionary["popularity"] as? Double
        poster_path = dictionary["poster_path"] as? String
        release_date = dictionary["release_date"] as? String
        title = dictionary["title"] as? String
        video = dictionary["video"] as? Bool
        vote_average = dictionary["vote_average"] as? Double
        vote_count = dictionary["vote_count"] as? Int
    }

        
/**
    Returns the dictionary representation for the current instance.
    
    - returns: NSDictionary.
*/
    public func dictionaryRepresentation() -> NSDictionary {

        let dictionary = NSMutableDictionary()

        dictionary.setValue(self.adult, forKey: "adult")
        dictionary.setValue(self.backdrop_path, forKey: "backdrop_path")
        dictionary.setValue(self.id, forKey: "id")
        dictionary.setValue(self.original_language, forKey: "original_language")
        dictionary.setValue(self.original_title, forKey: "original_title")
        dictionary.setValue(self.overview, forKey: "overview")
        dictionary.setValue(self.popularity, forKey: "popularity")
        dictionary.setValue(self.poster_path, forKey: "poster_path")
        dictionary.setValue(self.release_date, forKey: "release_date")
        dictionary.setValue(self.title, forKey: "title")
        dictionary.setValue(self.video, forKey: "video")
        dictionary.setValue(self.vote_average, forKey: "vote_average")
        dictionary.setValue(self.vote_count, forKey: "vote_count")

        return dictionary
    }

}
