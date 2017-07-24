//
//  Constants.swift
//  Bloodhoof
//
//  Created by Xiao Yan on 7/22/17.
//  Copyright © 2017 Xiao Yan. All rights reserved.
//

import Foundation
import UIKit


extension UIViewController {
    func popupSimpleAlert(title:String = "Warning!", message:String = "") {
        if self.presentedViewController != nil {
            self.presentedViewController?.dismiss(animated: false, completion: nil)
        }
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let OKAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(OKAction)
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    
    func popupAlert(title: String?, message: String?, actionTitles:[String?], actions:[((UIAlertAction) -> Void)?]) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        for (index, title) in actionTitles.enumerated() {
            let action = UIAlertAction(title: title, style: .default, handler: actions[index])
            alert.addAction(action)
        }
        self.present(alert, animated: true, completion: nil)
    }
    
    /*
    self.popupAlert(title: "Test", message: "Test", actionTitles: ["Good", "Bad"], actions: [
    {
    action1 in
    print("action 1!")
    },
    {
    action2 in
    print("action 2!")
    }
    ])
    */
}
