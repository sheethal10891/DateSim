//
//  UserRegistrationViewController.swift
//  DatingSimV0
//
//  Created by sshreedhara on 10/21/16.
//  Copyright © 2016 asastry. All rights reserved.
//

import UIKit

class PlayerInfoTableViewCell: UITableViewCell {
    
    // Text field to show the player's name
    @IBOutlet weak var playerNameLabel: UILabel!
    
    // This is the invite button
    @IBOutlet weak var TestBtn: UIButton!
    
    @IBOutlet weak var heartsIcon: UIImageView!
    
    @IBOutlet weak var heartCount: UILabel!
    @IBOutlet weak var busyIcon: UIImageView!
    @IBOutlet weak var pendingText: UILabel!
    @IBOutlet weak var challengeBtn: UIButton!
    @IBOutlet weak var ignoreBtn: UIButton!
    @IBOutlet weak var delicnedOrBusyText: UILabel!
}
