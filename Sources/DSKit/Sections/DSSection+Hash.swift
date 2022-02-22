//
//  DSSection+Count.swift
//  DSKit
//
//  Created by Borinschi Ivan on 04.02.2021.
//  Copyright © 2021 Borinschi Ivan. All rights reserved.
//

import Foundation

extension DSSection {
    
    // Get diffable hash combined with
    // header and footer
    var diffableHash: Int {
        
        var hasher = Hasher()
        
        if let headerHash = self.headerModelHash {
            hasher.combine(headerHash)
        }
        
        if let footerHash = self.footerModelHash {
            hasher.combine(footerHash)
        }
        
        hasher.combine(self.type.hashValue)
        
        return hasher.finalize()
    }
    
    // Get footer hash if exists
    var footerModelHash: Int? {
        
        if let model = footer {
            var hasher = Hasher()
            hasher.combine(model.hash())
            return hasher.finalize()
        }
        
        return nil
    }
    
    /// Get header hash if exists
    var headerModelHash: Int? {
        
        if let model = header {
            var hasher = Hasher()
            hasher.combine(model.hash())
            return hasher.finalize()
        }
        
        return nil
    }
}
