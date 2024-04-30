//
//  IntExtension.swift
//  MMModules
//
//  Created by Borinschi Ivan on 5/23/17.
//  Copyright © 2017 Borinschi Ivan. All rights reserved.
//

import Foundation

public extension Int {
    
    func toNSNumber() -> NSNumber {
        return NSNumber(value: self)
    }
    
    func stringAmount() -> String {
        return toNSNumber().fromCents().stringFormatted(withNumberOfDecimals: 2)
    }
    
    func toCents() -> Int {
        return self * 100
    }
    
    func string() -> String {
        return "\(self)"
    }
    
    func fromCents() -> Int {
        return self / 100
    }
}
