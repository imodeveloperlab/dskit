//
//  String+Random.swift
//  DSKit
//
//  Created by Borinschi Ivan on 25.01.2021.
//  Copyright © 2021 Borinschi Ivan. All rights reserved.
//

import Foundation

extension String {
    
    public func randomString(length: Int) -> String {
        
        let letters: NSString = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        let len = UInt32(letters.length)
        
        var randomString = ""
        
        for _ in 0 ..< length {
            let rand = arc4random_uniform(len)
            var nextChar = letters.character(at: Int(rand))
            randomString += NSString(characters: &nextChar, length: 1) as String
        }
        
        return randomString
    }
}
