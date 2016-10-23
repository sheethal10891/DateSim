//
//  UserRegistrationViewController.swift
//  DatingSimV0
//
//  Created by asastry on 10/21/16.
//  Copyright © 2016 asastry. All rights reserved.
//

import Foundation
import UIKit

class PlayerInfoTableViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    @IBOutlet weak var BusyText: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var startWorkingBtn: UIButton!
    @IBOutlet weak var playerName: UILabel!
    @IBOutlet weak var playerHeartsIcon: UIImageView!
    @IBOutlet weak var playerHeartsCount: UILabel!

    @IBOutlet weak var playerMoneyIcon: UIImageView!
    @IBOutlet weak var playerMoneyCount: UILabel!
    
    var players:[Int:PlayerInfo]=[:]
    var localPlayer = PlayerInfo()
    
    var iAmBusyText = ["I’m going to die lonely and have no-one to love me..",
                       "We have come to a verdict, you can’t find love/you are a loser?",
                       "Welcome to Singleville! Population: You..",
                       "As far as being single goes, you win."]
    
    static let storyboardIdentifier = "PlayerInfoTableViewController"
    
    var msgController:MessagesViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //write the hearts and money count to labels and remove current player info from players to populate the table
        playerMoneyCount.text = String(localPlayer.money)
        playerName.text = localPlayer.name
        playerHeartsCount.text =  String(localPlayer.hearts)
        playerMoneyIcon.image = UIImage(named: "Apple")
        playerHeartsIcon.image = UIImage(named: "Mango")
        BusyText.isHidden = true
        
        if((localPlayer.activity) != nil){
            if(localPlayer.activity?.withPlayer == ""){
               BusyText.text = iAmBusyText[Int(arc4random_uniform(4))]
               BusyText.isHidden = false
            }
            startWorkingBtn.isHidden = true
        }
        tableView.dataSource=self
        tableView.delegate=self
    }
    
    
    private func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return players.count
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell",
                                                 for: indexPath as IndexPath) as! PlayerInfoTableViewCell
        let player:PlayerInfo = players[indexPath.row + 1]!
        
        cell.resetElements()
        
        cell.heartsIcon.image = UIImage(named: "Apple")
        cell.heartCount.text = String(player.hearts)
        cell.playerController = self
        
        // handling only 3 states now
        // ideal scenario, should be checking against the player hash
        if(localPlayer.activity?.withPlayer == player.name){
            cell.setState(for: player , with: "busy", index: indexPath.row)
        }
        else if(localPlayer.inbox[indexPath.row + 1] == true){ // yeah! only the second person in the list!
            cell.setState(for: player , with: "hasInvite", index: indexPath.row)
        }
        else {
            cell.setState(for: player , with: "canInvite", index: indexPath.row)
        }
        return cell
    }
    
    
    public func inviting(player:String){
        
        //AARGH! Can't use hash!!
        msgController?.setInviting(to: "player1")
        

        
        
    }
    
    @IBAction func onStartWorking(_ sender: AnyObject) {
        msgController?.setStartWorking()
        
    }
    
}
