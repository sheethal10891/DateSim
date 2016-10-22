//
//  GameData.swift
//  DatingSimV0
//
//  Created by sshreedhara on 10/22/16.
//  Copyright © 2016 asastry. All rights reserved.
//

import Foundation
class GameData: EVObject {

    // Player Index for identity
    var playerIndex = 0
    
    // Array of active players
    var playerMap:[String]?
    
    // Array of each player's data
    //var playerData:[PlayerInfo]?
    
    // Creating 4 player objects 
    var player0:PlayerInfo?
    var player1:PlayerInfo?
    var player2:PlayerInfo?
    var player3:PlayerInfo?
    
}
