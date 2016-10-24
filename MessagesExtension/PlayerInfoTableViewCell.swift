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
    
    @IBOutlet weak var onInviteButtonClick: UIButton!
    @IBOutlet weak var onIgnoreBtnClick: UIButton!
    @IBOutlet weak var heartsIcon: UIImageView!
    
    @IBOutlet weak var heartCount: UILabel!
    @IBOutlet weak var busyIcon: UIImageView!
    @IBOutlet weak var pendingText: UILabel!
    @IBOutlet weak var busyImage: UIImageView!
    // Yes to response
    @IBOutlet weak var challengeBtn: UIButton!
    @IBOutlet weak var ignoreBtn: UIButton!
    @IBOutlet weak var delicnedOrBusyText: UILabel!
    

    var playerController:PlayerInfoTableViewController?
    
    var invitedText:[String] = ["Are you a magician? Because whenever I look at you everyone else disappears.",
                       "I have to show you the prettiest girl I’ve ever seen. (show phone with front cam)",
                       "You must be Jelly, cause jam don’t shake like that.",
                       "Sorry, I can’t hold on… I’ve already fallen for you.",
                       "Would you grab my arm so I can tell my friends I’ve been touched by an angel?",
                       "Was that an earthquake or did you just rock my world?",
                       "On a scale of 1 to 10, you’re a 9. I’m the 1 you need.",
                       "Damn Girl is your name Wifi ? Because I’m feeling a connection!",
                       "You know what material this is? Grabs his shirt Boyfriend material."]
    
    var onADateText:[String] = ["Hot Mama wants to be your favourite hello and your hardest goodbye.",
                       "Hot Mama feels you are his/her sunshine on a rainy day",                       "Screw butterflies, I feel the whole zoo when I’m with you"]
    
    var tooBusyText:[String] = ["I have other priorities right now.",
                                "Sorry, I'm busy attending to other matters.",
                                "Hey, I'm busy being happy, so yeah, not now.",
                                "Sorry, I dropped my phone and I can’t find it. I’l text you when I find it."
    ]
    
    public func resetElements() {

        playerNameLabel.isHidden = true
        TestBtn.isHidden = true
        heartsIcon.isHidden = true
        heartCount.isHidden = true
        busyIcon.isHidden = true
        pendingText.isHidden = true
        challengeBtn.isHidden = true
        ignoreBtn.isHidden = true
        delicnedOrBusyText.isHidden = true
    }
    
    

    @IBAction func OnInviteClick(_ sender: AnyObject) {
        
         playerController?.inviting(player: "player1")//playerInfo.name)
    }
    
    //Using this to say yes to the Invite
    @IBAction func onChallegeClick(_ sender: AnyObject) {
        playerController?.acceptInvite(player:"player1")
    }

    public func setState(for player:PlayerInfo, with state:String, index:Int ,_ busy:Bool) {
    //    playerInfo = player
        playerNameLabel.text = player.name
        playerNameLabel.isHidden = false
        
        heartsIcon.isHidden = false
        heartCount.text = "\(player.hearts)"
        heartCount.isHidden = false
        
        switch state {
        case "busy":
            delicnedOrBusyText.text = onADateText[Int(arc4random_uniform(3))]
            delicnedOrBusyText.isHidden = false
            delicnedOrBusyText.adjustsFontSizeToFitWidth = true
            busyIcon.image = UIImage(named: "heartsbusy")
            busyIcon.isHidden = false
            break
        case "hasInvite":
            delicnedOrBusyText.text = invitedText[Int(arc4random_uniform(9))]
            delicnedOrBusyText.isHidden = false
            delicnedOrBusyText.adjustsFontSizeToFitWidth = true

            challengeBtn.setTitle("Woohoo!", for: .normal)
            challengeBtn.isHidden = false
            challengeBtn.isEnabled = !busy
            ignoreBtn.setTitle("No", for: .normal)
            ignoreBtn.isHidden = false
            ignoreBtn.isEnabled = !busy
            break
        case "canInvite":
            pendingText.text = "Ask " + player.name + " for a date"
            pendingText.adjustsFontSizeToFitWidth = true
            pendingText.isHidden = busy && false
            TestBtn.isHidden = false
            TestBtn.isEnabled = !busy
           // TestBtn.tag = index
          //  TestBtn.addTarget(self, action: Selector("buttonClicked:"), for: UIControlEvents.touchUpInside)
            break
        case "canChallenge":
            delicnedOrBusyText.text = tooBusyText[Int(arc4random_uniform(4))]
            delicnedOrBusyText.isHidden = false
            
            challengeBtn.setTitle("How dare you!", for: .normal)
            challengeBtn.isHidden = false
            challengeBtn.isEnabled = true
            
            ignoreBtn.setTitle("Ignore", for: .normal)
            ignoreBtn.isHidden = false
            ignoreBtn.isEnabled = true
            break
        default:
            TestBtn.isHidden = true
        }
        
        
    }
}
