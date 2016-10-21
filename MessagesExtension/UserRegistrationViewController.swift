//
//  UserRegistrationViewController.swift
//  DatingSimV0
//
//  Created by asastry on 10/21/16.
//  Copyright © 2016 asastry. All rights reserved.
//

import Foundation
import UIKit

class UserRegistrationViewController: UIViewController {
    
    static let storyboardIdentifier = "UserRegistrationViewController"
    
    var msgController:MessagesViewController?
    
    @IBAction func onJoinBtnClick(_ sender: AnyObject) {
        if ((msgController) != nil) {
            msgController?.registerLocalUser()
        }
    }
}
