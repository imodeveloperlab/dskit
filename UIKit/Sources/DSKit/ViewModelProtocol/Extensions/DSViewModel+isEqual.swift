//
//  DSViewModel+isEqual.swift
//  DSKit
//
//  Created by Borinschi Ivan on 27.01.2021.
//  Copyright © 2021 Borinschi Ivan. All rights reserved.
//

import Foundation

public extension DSViewModel {
    
    /// Check if view model is equal to other view model
    /// - Parameter object: DSViewModel
    /// - Returns: Bool
    func isEqual(to object: DSViewModel) -> Bool {
        return false
    }
}

public extension Array where Element == DSViewModel {
    
    /// Check if array of view model are equal to other array of view models
    /// - Parameter array: [DSViewModel]
    /// - Returns: Bool
    func isEqual(to array: [DSViewModel]) -> Bool {
        
        if self.count != array.count {
            return false
        }
        
        for (index, element) in self.enumerated() {
            let compareTo = array[index]
            if !element.isEqual(to: compareTo) {
                return false
            }
        }
        
        return true
    }
}
