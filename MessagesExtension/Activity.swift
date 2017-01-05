//
//  Activity.swift
//  DatingSimV0
//
//  Created by sshreedhara on 10/22/16.
//  Copyright © 2016 asastry. All rights reserved.
//

import Foundation


class Activity: EVObject {
    
    var withPlayer:String = ""
    var startTime:Double = 0
    let duration:Int = 120
    
    public func setActivity(with playerID:Int) {
        if (playerID >= 0) {
            withPlayer = "\(playerID)"
        }
        startTime = NSDate().timeIntervalSince1970
    }
    
    
}
