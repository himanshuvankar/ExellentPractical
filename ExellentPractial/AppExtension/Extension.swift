//
//  Extension.swift
//  ExellentPractial
//
//  Created by imobdev on 25/12/21.
//

import Foundation
import UIKit

extension UIViewController{
    func showAlert(message: String, title: String = "") {
      let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
      let OKAction = UIAlertAction(title: "OK", style: .default, handler: nil)
      alertController.addAction(OKAction)
      self.present(alertController, animated: true, completion: nil)
    }
}
