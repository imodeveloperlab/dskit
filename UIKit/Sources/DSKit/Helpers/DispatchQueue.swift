//
//  DispatchQueue.swift
//  DSKit
//
//  Created by Borinschi Ivan on 30.11.2020.
//  Copyright © 2021 Borinschi Ivan. All rights reserved.
//

import Foundation

public extension DispatchQueue {
    
    /// Execute closure after an random delay on main tread
    /// - Parameters:
    ///   - min: Minim delay
    ///   - max: Maxim delay
    ///   - closure: Closure to execute
    func randomDelay(min: TimeInterval = 0.0, max: TimeInterval = 1.0, _ closure: @escaping () -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + Double.random(in: min...max)) {
            closure()
        }
    }
    
    /// Execute closure on main thread after delay
    /// - Parameters:
    ///   - after: Delay
    ///   - closure: Closure to execute
    func after(_ after: TimeInterval = 0.5, _ closure: @escaping () -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + after) {
            closure()
        }
    }
    
    /// Execute closure on main thread now, used to move executions from other threads to main
    /// - Parameter closure: Closure to execute
    func now(_ closure: @escaping () -> Void) {
        self.after(0.0, closure)
    }
}
