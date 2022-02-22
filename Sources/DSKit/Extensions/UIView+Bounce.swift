//
//  UIView+Bounce.swift
//  DSKit
//
//  Created by Borinschi Ivan on 25.01.2021.
//  Copyright © 2021 Borinschi Ivan. All rights reserved.
//

import UIKit

public extension UIView {
    
    func bounce() {
        
        let identityAnimation = CGAffineTransform.identity
        let scaleOfIdentity = identityAnimation.scaledBy(x: 1.0, y: 1.0)
        self.transform = scaleOfIdentity
        
        UIView.animate(withDuration: 0.3/1.5, delay: 0.0, options: .curveEaseOut, animations: {
            
            if self.frame.size.width > 100 {
                
                let scaleOfIdentity = identityAnimation.scaledBy(x: 1.05, y: 1.05)
                self.transform = scaleOfIdentity
                
            } else {
                
                let scaleOfIdentity = identityAnimation.scaledBy(x: 1.2, y: 1.2)
                self.transform = scaleOfIdentity
            }
            
        }, completion: { _ in
            
            UIView.animate(withDuration: 0.3/2, delay: 0.0, options: .curveEaseInOut, animations: {
                
                if self.frame.size.width > 100 {
                    
                    let scaleOfIdentity = identityAnimation.scaledBy(x: 0.98, y: 0.98)
                    self.transform = scaleOfIdentity
                    
                } else {
                    
                    let scaleOfIdentity = identityAnimation.scaledBy(x: 0.9, y: 0.9)
                    self.transform = scaleOfIdentity
                }
                
            }, completion: { _ in
                
                UIView.animate(withDuration: 0.3/2, delay: 0.0, options: .curveEaseOut, animations: {
                    self.transform = identityAnimation
                })
            })
            
        })
    }
}
