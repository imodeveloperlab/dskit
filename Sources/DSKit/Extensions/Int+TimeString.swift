//
//  Int+TimeString.swift
//  DSKit
//
//  Created by Borinschi Ivan on 25.01.2021.
//  Copyright © 2021 Borinschi Ivan. All rights reserved.
//

import Foundation

public extension Int {
    
    /// Convert int to time string, 120 seconds to 01:59
    ///
    /// - Returns: String
    func timeString() -> String {
        
        let minutes = (self % 3600) / 60
        let seconds = (self % 3600) % 60
        
        var minutesString = "\(minutes)"
        var secondsString = "\(seconds)"
        
        if minutesString.count == 1 {
            minutesString = "0\(minutesString)"
        }
        
        if secondsString.count == 1 {
            secondsString = "0\(secondsString)"
        }
        
        return "\(minutesString):\(secondsString)"
    }
}
