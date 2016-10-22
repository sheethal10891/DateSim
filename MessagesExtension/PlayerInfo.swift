//
//  PlayerInfo.swift
//  DatingSimV0
//
//  Created by sshreedhara on 10/21/16.
//  Copyright © 2016 asastry. All rights reserved.
//

import Foundation
class PlayerInfo: EVObject {
    
    var money:Int
    var activity:Activity?
    var inbox:[String:Bool]  // PlayerID Array
    var sent:[String:Bool]
    var hearts:Int = 0
    
    required init(){
        
        money = 100
        activity = nil
        inbox = [:]
        sent = [:]
        hearts = 0
        super.init()
        
        
    }
    
    
}
