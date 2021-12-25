/* 
Copyright (c) 2021 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
*/

import Foundation
 
/* For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar */

public class MovieDetailModel {
	public var adult : Bool?
	public var backdrop_path : String?
	public var belongs_to_collection : Belongs_to_collection?
	public var budget : Int?
	public var genres : Array<Genres>?
	public var homepage : String?
	public var id : Int?
	public var imdb_id : String?
	public var original_language : String?
	public var original_title : String?
	public var overview : String?
	public var popularity : Double?
	public var poster_path : String?
	public var production_companies : Array<Production_companies>?
	public var production_countries : Array<Production_countries>?
	public var release_date : String?
	public var revenue : Int?
	public var runtime : Int?
	public var spoken_languages : Array<Spoken_languages>?
	public var status : String?
	public var tagline : String?
	public var title : String?
	public var video : Bool?
	public var vote_average : Double?
	public var vote_count : Int?

/**
    Returns an array of models based on given dictionary.
    
    Sample usage:
    let json4Swift_Base_list = Json4Swift_Base.modelsFromDictionaryArray(someDictionaryArrayFromJSON)

    - parameter array:  NSArray from JSON dictionary.

    - returns: Array of Json4Swift_Base Instances.
*/
    public class func modelsFromDictionaryArray(array:NSArray) -> [MovieDetailModel]
    {
        var models:[MovieDetailModel] = []
        for item in array
        {
            models.append(MovieDetailModel(dictionary: item as! NSDictionary)!)
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

		adult = dictionary["adult"] as? Bool
		backdrop_path = dictionary["backdrop_path"] as? String
		if (dictionary["belongs_to_collection"] != nil) { belongs_to_collection = Belongs_to_collection(dictionary: dictionary["belongs_to_collection"] as! NSDictionary) }
		budget = dictionary["budget"] as? Int
        if (dictionary["genres"] != nil) { genres = Genres.modelsFromDictionaryArray(array: dictionary["genres"] as! NSArray) }
		homepage = dictionary["homepage"] as? String
		id = dictionary["id"] as? Int
		imdb_id = dictionary["imdb_id"] as? String
		original_language = dictionary["original_language"] as? String
		original_title = dictionary["original_title"] as? String
		overview = dictionary["overview"] as? String
		popularity = dictionary["popularity"] as? Double
		poster_path = dictionary["poster_path"] as? String
        if (dictionary["production_companies"] != nil) { production_companies = Production_companies.modelsFromDictionaryArray(array: dictionary["production_companies"] as! NSArray) }
        if (dictionary["production_countries"] != nil) { production_countries = Production_countries.modelsFromDictionaryArray(array: dictionary["production_countries"] as! NSArray) }
		release_date = dictionary["release_date"] as? String
		revenue = dictionary["revenue"] as? Int
		runtime = dictionary["runtime"] as? Int
        if (dictionary["spoken_languages"] != nil) { spoken_languages = Spoken_languages.modelsFromDictionaryArray(array: dictionary["spoken_languages"] as! NSArray) }
		status = dictionary["status"] as? String
		tagline = dictionary["tagline"] as? String
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
		dictionary.setValue(self.belongs_to_collection?.dictionaryRepresentation(), forKey: "belongs_to_collection")
		dictionary.setValue(self.budget, forKey: "budget")
		dictionary.setValue(self.homepage, forKey: "homepage")
		dictionary.setValue(self.id, forKey: "id")
		dictionary.setValue(self.imdb_id, forKey: "imdb_id")
		dictionary.setValue(self.original_language, forKey: "original_language")
		dictionary.setValue(self.original_title, forKey: "original_title")
		dictionary.setValue(self.overview, forKey: "overview")
		dictionary.setValue(self.popularity, forKey: "popularity")
		dictionary.setValue(self.poster_path, forKey: "poster_path")
		dictionary.setValue(self.release_date, forKey: "release_date")
		dictionary.setValue(self.revenue, forKey: "revenue")
		dictionary.setValue(self.runtime, forKey: "runtime")
		dictionary.setValue(self.status, forKey: "status")
		dictionary.setValue(self.tagline, forKey: "tagline")
		dictionary.setValue(self.title, forKey: "title")
		dictionary.setValue(self.video, forKey: "video")
		dictionary.setValue(self.vote_average, forKey: "vote_average")
		dictionary.setValue(self.vote_count, forKey: "vote_count")

		return dictionary
	}

}
public class Belongs_to_collection {
    public var id : Int?
    public var name : String?
    public var poster_path : String?
    public var backdrop_path : String?

/**
    Returns an array of models based on given dictionary.
    
    Sample usage:
    let belongs_to_collection_list = Belongs_to_collection.modelsFromDictionaryArray(someDictionaryArrayFromJSON)

    - parameter array:  NSArray from JSON dictionary.

    - returns: Array of Belongs_to_collection Instances.
*/
    public class func modelsFromDictionaryArray(array:NSArray) -> [Belongs_to_collection]
    {
        var models:[Belongs_to_collection] = []
        for item in array
        {
            models.append(Belongs_to_collection(dictionary: item as! NSDictionary)!)
        }
        return models
    }

/**
    Constructs the object based on the given dictionary.
    
    Sample usage:
    let belongs_to_collection = Belongs_to_collection(someDictionaryFromJSON)

    - parameter dictionary:  NSDictionary from JSON.

    - returns: Belongs_to_collection Instance.
*/
    required public init?(dictionary: NSDictionary) {

        id = dictionary["id"] as? Int
        name = dictionary["name"] as? String
        poster_path = dictionary["poster_path"] as? String
        backdrop_path = dictionary["backdrop_path"] as? String
    }

        
/**
    Returns the dictionary representation for the current instance.
    
    - returns: NSDictionary.
*/
    public func dictionaryRepresentation() -> NSDictionary {

        let dictionary = NSMutableDictionary()

        dictionary.setValue(self.id, forKey: "id")
        dictionary.setValue(self.name, forKey: "name")
        dictionary.setValue(self.poster_path, forKey: "poster_path")
        dictionary.setValue(self.backdrop_path, forKey: "backdrop_path")

        return dictionary
    }

}
public class Genres {
    public var id : Int?
    public var name : String?

/**
    Returns an array of models based on given dictionary.
    
    Sample usage:
    let genres_list = Genres.modelsFromDictionaryArray(someDictionaryArrayFromJSON)

    - parameter array:  NSArray from JSON dictionary.

    - returns: Array of Genres Instances.
*/
    public class func modelsFromDictionaryArray(array:NSArray) -> [Genres]
    {
        var models:[Genres] = []
        for item in array
        {
            models.append(Genres(dictionary: item as! NSDictionary)!)
        }
        return models
    }

/**
    Constructs the object based on the given dictionary.
    
    Sample usage:
    let genres = Genres(someDictionaryFromJSON)

    - parameter dictionary:  NSDictionary from JSON.

    - returns: Genres Instance.
*/
    required public init?(dictionary: NSDictionary) {

        id = dictionary["id"] as? Int
        name = dictionary["name"] as? String
    }

        
/**
    Returns the dictionary representation for the current instance.
    
    - returns: NSDictionary.
*/
    public func dictionaryRepresentation() -> NSDictionary {

        let dictionary = NSMutableDictionary()

        dictionary.setValue(self.id, forKey: "id")
        dictionary.setValue(self.name, forKey: "name")

        return dictionary
    }

}
public class Production_companies {
    public var id : Int?
    public var logo_path : String?
    public var name : String?
    public var origin_country : String?

/**
    Returns an array of models based on given dictionary.
    
    Sample usage:
    let production_companies_list = Production_companies.modelsFromDictionaryArray(someDictionaryArrayFromJSON)

    - parameter array:  NSArray from JSON dictionary.

    - returns: Array of Production_companies Instances.
*/
    public class func modelsFromDictionaryArray(array:NSArray) -> [Production_companies]
    {
        var models:[Production_companies] = []
        for item in array
        {
            models.append(Production_companies(dictionary: item as! NSDictionary)!)
        }
        return models
    }

/**
    Constructs the object based on the given dictionary.
    
    Sample usage:
    let production_companies = Production_companies(someDictionaryFromJSON)

    - parameter dictionary:  NSDictionary from JSON.

    - returns: Production_companies Instance.
*/
    required public init?(dictionary: NSDictionary) {

        id = dictionary["id"] as? Int
        logo_path = dictionary["logo_path"] as? String
        name = dictionary["name"] as? String
        origin_country = dictionary["origin_country"] as? String
    }

        
/**
    Returns the dictionary representation for the current instance.
    
    - returns: NSDictionary.
*/
    public func dictionaryRepresentation() -> NSDictionary {

        let dictionary = NSMutableDictionary()

        dictionary.setValue(self.id, forKey: "id")
        dictionary.setValue(self.logo_path, forKey: "logo_path")
        dictionary.setValue(self.name, forKey: "name")
        dictionary.setValue(self.origin_country, forKey: "origin_country")

        return dictionary
    }

}
public class Production_countries {
    public var iso_3166_1 : String?
    public var name : String?

/**
    Returns an array of models based on given dictionary.
    
    Sample usage:
    let production_countries_list = Production_countries.modelsFromDictionaryArray(someDictionaryArrayFromJSON)

    - parameter array:  NSArray from JSON dictionary.

    - returns: Array of Production_countries Instances.
*/
    public class func modelsFromDictionaryArray(array:NSArray) -> [Production_countries]
    {
        var models:[Production_countries] = []
        for item in array
        {
            models.append(Production_countries(dictionary: item as! NSDictionary)!)
        }
        return models
    }

/**
    Constructs the object based on the given dictionary.
    
    Sample usage:
    let production_countries = Production_countries(someDictionaryFromJSON)

    - parameter dictionary:  NSDictionary from JSON.

    - returns: Production_countries Instance.
*/
    required public init?(dictionary: NSDictionary) {

        iso_3166_1 = dictionary["iso_3166_1"] as? String
        name = dictionary["name"] as? String
    }

        
/**
    Returns the dictionary representation for the current instance.
    
    - returns: NSDictionary.
*/
    public func dictionaryRepresentation() -> NSDictionary {

        let dictionary = NSMutableDictionary()

        dictionary.setValue(self.iso_3166_1, forKey: "iso_3166_1")
        dictionary.setValue(self.name, forKey: "name")

        return dictionary
    }

}
public class Spoken_languages {
    public var english_name : String?
    public var iso_639_1 : String?
    public var name : String?

/**
    Returns an array of models based on given dictionary.
    
    Sample usage:
    let spoken_languages_list = Spoken_languages.modelsFromDictionaryArray(someDictionaryArrayFromJSON)

    - parameter array:  NSArray from JSON dictionary.

    - returns: Array of Spoken_languages Instances.
*/
    public class func modelsFromDictionaryArray(array:NSArray) -> [Spoken_languages]
    {
        var models:[Spoken_languages] = []
        for item in array
        {
            models.append(Spoken_languages(dictionary: item as! NSDictionary)!)
        }
        return models
    }

/**
    Constructs the object based on the given dictionary.
    
    Sample usage:
    let spoken_languages = Spoken_languages(someDictionaryFromJSON)

    - parameter dictionary:  NSDictionary from JSON.

    - returns: Spoken_languages Instance.
*/
    required public init?(dictionary: NSDictionary) {

        english_name = dictionary["english_name"] as? String
        iso_639_1 = dictionary["iso_639_1"] as? String
        name = dictionary["name"] as? String
    }

        
/**
    Returns the dictionary representation for the current instance.
    
    - returns: NSDictionary.
*/
    public func dictionaryRepresentation() -> NSDictionary {

        let dictionary = NSMutableDictionary()

        dictionary.setValue(self.english_name, forKey: "english_name")
        dictionary.setValue(self.iso_639_1, forKey: "iso_639_1")
        dictionary.setValue(self.name, forKey: "name")

        return dictionary
    }

}
