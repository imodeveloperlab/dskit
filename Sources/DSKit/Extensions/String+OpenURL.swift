//
//  String+OpenURL.swift
//  DSKit
//
//  Created by Borinschi Ivan on 25.01.2021.
//  Copyright © 2021 Borinschi Ivan. All rights reserved.
//

import Foundation

public extension String {
    
    func open() {
        
        if let url = URL(string: self) {
            
            if self.isEmail() {
                self.openEmail()
            } else {
                URLOpener.open(url, options: [:], completion: nil)
            }
        }
    }
    
    @discardableResult
    func openEmail() -> URL? {
        let email = self
        if let url = URL(string: "mailto:\(email)") {
            URLOpener.open(url, options: [:], completion: nil)
            return url
        }
        return nil
    }
    
    @discardableResult

    func openPhone() -> URL? {
        var number = self.replacingOccurrences(of: "+", with: "00")
        number = number.replacingOccurrences(of: " ", with: "")
        guard let phoneNumber = URL(string: "tel://" + number) else {
            return nil
        }
        
        URLOpener.open(phoneNumber, options: [:], completion: nil)
        return phoneNumber
    }
    
    func isEmail() -> Bool {
        return self.contains("@")
    }
}
