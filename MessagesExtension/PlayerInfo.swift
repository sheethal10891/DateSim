//
//  PlayerInfo.swift
//  DatingSimV0
//
//  Created by sshreedhara on 10/21/16.
//  Copyright © 2016 asastry. All rights reserved.
//

import Foundation
class PlayerInfo: EVObject {
    
    var name:String
    var money:Int
    var activity:Activity?
    var inbox:[Bool]  
    var sent:[Bool]
    var hearts:Int = 0
    
    required init(){
        
        name = "ANAMIKA"
        money = 100
        activity = nil
        //because I can't have a hash!
        inbox = [false,false,false,false]
        sent = [false,false,false,false]
        hearts = 0
        super.init()
        
        
    }
    
    
}
