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
    
    var players = [PlayerInfo]()
    
    static let storyboardIdentifier = "PlayerInfoTableViewController"
    
    var msgController:MessagesViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
        
        cell.playerNameLabel?.text = player.name
        
        return cell
    }
    
}
