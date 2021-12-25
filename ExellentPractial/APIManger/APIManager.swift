//
//  APIManager.swift
//  ExellentPractial
//
//  Created by imobdev on 25/12/21.
//

import Foundation
import UIKit
import Alamofire

struct AlamofireReturn {
    var objData: AnyObject?
    var success: Bool?
    var error: Error?
}



typealias CompletionHandler = (AlamofireReturn) -> Void

class APIManager {
    
    static let shared = APIManager()
    static var isTokenPass = false
    
    //MARK: - Alamofire main request
    func alamofireRequestMain(methodType: HTTPMethod = .get, serviceURL: String, parameter: [String: Any]?,responseHandler: @escaping (APIResposne)->Void) {
        
        
        
        let headers: HTTPHeaders = ["Content-Type": "application/json","Accept": "application/json"]
        
        
        AF.request(serviceURL, method: methodType, parameters: parameter, encoding: JSONEncoding.default, headers: headers).responseJSON { response in
            
            switch(response.result) {
            case .success(_):
                if (response.value != nil)
                {
//                    responseHandler(APIResposne(status: true, message: message, data: dict, error: nil, response_code: ResponseCode(rawValue: response_code)))
                }
                break
                
            case .failure(_):
                
                responseHandler(APIResposne(status: false, message: "", data: [:], error: nil, response_code: ResponseCode(rawValue: 0)))
                break
            }
        }
    }
    func showAlert(message: String, title: String = "") {
      let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
      let OKAction = UIAlertAction(title: "OK", style: .default, handler: nil)
      alertController.addAction(OKAction)
//        self.window?.rootViewController?.present(alertController, animated: true, completion: nil)
    }
}
struct APIResposne {
    
    var status: Bool
    var message: String
    var data: [String: Any]
    var error: Error?
    
    var response_code : ResponseCode?
}
enum ResponseCode : Int{
    
    case SUCCESS = 1
    case FAIL = 0
    case NORECORD = 2
    case NOINTERNET = -1
}
