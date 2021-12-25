//
//  Contrant.swift
//  ExellentPractial
//
//  Created by imobdev on 25/12/21.
//

import Foundation
import UIKit
import Alamofire
let APPDELEGATE = UIApplication.shared.delegate as! AppDelegate
let contextManaged = APPDELEGATE.persistentContainer.viewContext

struct GlobalConstants {
    static let APIKEY_Value = "14bc774791d9d20b3a138bb6e26e2579"
    static let SelectedLanguage = "en-US"
    static let PlaceHolderImageName = "placeholder"
}

struct AppApiKeys {
    static let apikey = "api_key"
    static let language = "language"
    
    static let adult = "adult"
    static let backdrop_path = "backdrop_path"
    static let genre_ids = "genre_ids"
    static let id = "id"
    static let original_language = "original_language"
    static let original_title = "original_title"
    static let overview = "overview"
    static let popularity = "popularity"
    static let poster_path = "poster_path"
    
    static let release_date = "release_date"
    static let title = "title"
    static let video = "video"
    static let vote_average = "vote_average"
    static let vote_count = "vote_count"
}

struct TableName{
    static let MoviesList = "MoviesList"
}
class Connectivity {
    class var isConnectedToInternet:Bool {
        return NetworkReachabilityManager()!.isReachable
    }
}
