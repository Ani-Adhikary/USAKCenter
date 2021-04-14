//
//  Alert.swift
//  USAKneeCenters
//
//  Created by Anindita Adhikary on 02/04/18.
//

import Foundation
import UIKit

class Alert {
    
    class func showBasicAlert(title: String, message: String, vc: UIViewController) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        vc.present(alert, animated: true)
    }
}
