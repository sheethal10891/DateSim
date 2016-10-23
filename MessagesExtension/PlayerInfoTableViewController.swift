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
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var playerName: UILabel!
    @IBOutlet weak var playerHeartsIcon: UIImageView!
    @IBOutlet weak var playerHeartsCount: UILabel!
    @IBOutlet weak var playerMoneyIcon: UIImageView!
    @IBOutlet weak var playerMoneyCount: UILabel!
    
    var players = [PlayerInfo]()
    var localPlayer = PlayerInfo()
    
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
        let player = players[indexPath.row]
        
        cell.resetElements()
        
        cell.heartsIcon.image = UIImage(named: "Apple")
        cell.heartCount.text = String(player.hearts)
        cell.playerController = self
        
        // handling only 3 states now
        // ideal scenario, should be checking against the player hash
        if(localPlayer.activity?.withPlayer == player.name){
            cell.setState(for: player , with: "busy", index: indexPath.row)
        }
        else if(player.inbox.count > 0 && player.inbox[(msgController?.localPlayerRegID)!] == true){
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
    
}
