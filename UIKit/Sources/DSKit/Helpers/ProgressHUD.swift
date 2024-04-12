//
//  Spinner.swift
//  DSKit
//
//  Created by Borinschi Ivan on 30.11.2020.
//  Copyright © 2021 Borinschi Ivan. All rights reserved.
//

import UIKit
import Foundation
import Cartography

let progressHUDTag = 999

class ProgressHUD: UIView {
  
    private var loadingReferenceCount: Int = 0
    
    var hudMask = UIView()
    var hudHolder = UIView()
    let activityIndictor: DSMaterialSpinner
    
    init(onView: UIView) {

        activityIndictor = DSMaterialSpinner(color: DSAppearance.shared.main.brandColor)
        super.init(frame: CGRect(x: 0, y: 0, width: 90, height: 90))
        onView.addSubview(self)
        tag = progressHUDTag
        setUp()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUp() {
        
        self.hudHolder.accessibilityIdentifier = "PROGRESS_HUD"
        
        self.isUserInteractionEnabled = false
        hudMask.isUserInteractionEnabled = false
        hudHolder.isUserInteractionEnabled = false
        activityIndictor.isUserInteractionEnabled = false
        
        if #available(iOS 13.0, *) {
            
            hudMask.backgroundColor = UIColor { traitCollection in
                
                if traitCollection.userInterfaceStyle == .dark {
                    
                    return .darkGray
                    
                } else {
                    
                    return .darkGray
                }
            }
            
        } else {

            hudMask.backgroundColor = .darkGray
        }
        
        hudHolder.backgroundColor = DSAppearance.shared.main.primaryView.background
        hudHolder.layer.cornerRadius = 2 + CGFloat(DSAppearance.shared.main.primaryView.cornerRadius)
        hudHolder.clipsToBounds = true
        
        self.addSubview(hudMask)
        self.addSubview(hudHolder)
        
        hudHolder.addSubview(activityIndictor)
        activityIndictor.forceBeginRefreshing()
        
        constrain(hudMask, self.superview!) { view, superview in
            view.edges == superview.edges
        }
        
        constrain(hudHolder, self.superview!) { view, superview in
            view.center == superview.center
            view.width == 90
            view.height == 90
        }
        
        constrain(self, self.superview!) { view, superview in
            view.edges == superview.edges
        }
        
        constrain(hudHolder, activityIndictor) { hudHolder, activityIndictor in
            activityIndictor.width == 50
            activityIndictor.height == 50
            activityIndictor.centerX == hudHolder.centerX
            activityIndictor.centerY == hudHolder.centerY
        }
        
        self.hudHolder.alpha = 0
        self.hudMask.alpha = 0
    }
    
    private func show(delayShowLoading: Bool = true) {
        
        if delayShowLoading {
            
            DispatchQueue.main.after(0.4) {
                if self.loadingReferenceCount > 0 {
                    UIView.animate(withDuration: 0.5, animations: {
                        self.hudHolder.alpha = 1
                        self.hudMask.alpha = 0.06
                    })
                }
            }
            
        } else {
            UIView.animate(withDuration: 0.5, animations: {
                self.hudHolder.alpha = 1
                self.hudMask.alpha = 0.06
            })
        }
    }
    
    private func hide() {
        
        //WE ARE USING THIS DELAY TO PREVENT SPINNER FLICKERING
        //IF ANOTHER LOADING IS REQUESTED RIGHT AFTER CURRENT ONE
        DispatchQueue.main.after(0.5) {
            if self.loadingReferenceCount <= 0 {
                UIView.animate(withDuration: 0.3, animations: {
                    self.hudHolder.alpha = 0
                    self.hudMask.alpha = 0
                })
            }
        }
    }
    
    func loading(_ loading: Bool, delayShowLoading: Bool = true, file: String, line: Int) {
        
        if loading {
            loadingReferenceCount += 1
            //print("🌀 + \(loadingReferenceCount) \(file) \(line) \(self.description)")
        } else {
            loadingReferenceCount -= 1
            //print("🌀 - \(loadingReferenceCount) \(file) \(line) \(self.description)")
        }
        
        if loadingReferenceCount < 0 {
            //print("❌ Bad loading reference count in \(self)")
            loadingReferenceCount = 0
        }
        
        if let superview = self.superview {
            
            superview.bringSubviewToFront(self)
            
            if loadingReferenceCount > 0 {
                self.show(delayShowLoading: delayShowLoading)
                if !ProcessInfo.processInfo.arguments.contains("UI_TEST_MODE") {
                    superview.isUserInteractionEnabled = false
                }
                
            } else {
                self.hide()
                if !ProcessInfo.processInfo.arguments.contains("UI_TEST_MODE") {
                    superview.isUserInteractionEnabled = true
                }
            }
        }
    }
    
    deinit {
        //print("☠ Deinit \(self)")
    }
}
