//
//  CreateAlertController.swift
//  mobile_mentor_ios_code_challenge
//
//  Created by Jeremy Barger on 2/12/19.
//  Copyright © 2019 Elite Endurance Louisville. All rights reserved.
//

import Foundation
import UIKit

class CreateAlertController {
    
    func withCancelAction(title: String, message: String) -> UIAlertController {
        let cancelAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addAction(cancelAction)
        
        return alertController
    }
    
    func withTwoActions(title: String, message: String) -> UIAlertController {
        let cancelAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addAction(cancelAction)
        
        return alertController
    }
    
    func withNoActions(title: String, message: String) -> UIAlertController {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        return alertController
    }
    
}
