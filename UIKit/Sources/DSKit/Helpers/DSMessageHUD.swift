//
//  DSMessageHUD.swift
//  DSKit
//
//  Created by Borinschi Ivan on 30.11.2020.
//  Copyright © 2021 Borinschi Ivan. All rights reserved.
//

import UIKit
import Foundation
import Cartography

let messageHUDTag = 998

public enum DSMessageType {
    case `default`
    case success
    case warning
    case error
}

class DSMessageHUD: UIView {
    
    var constraintsGroup = ConstraintGroup()
    
    init(onView: UIView) {
        
        super.init(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        onView.addSubview(self)
        tag = messageHUDTag
        setUp()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var hudMask = UIView()
    var hudHolder = UIView()
    var icon = UIImageView()
    var label = UILabel()
    
    func setUp() {
        
        let appearance = DSAppearance.shared.main
        
        isUserInteractionEnabled = false
        hudMask.isUserInteractionEnabled = false
        hudHolder.isUserInteractionEnabled = false
        
        hudMask.alpha = 0
        hudHolder.alpha = 0
        
        icon.tintColor = appearance.brandColor
        label.textAlignment = .center
        label.numberOfLines = 0
        label.accessibilityIdentifier = "SUCCESS_LABEL"
        
        hudMask.backgroundColor = .black
        hudHolder.backgroundColor = appearance.primaryView.background
        hudHolder.layer.cornerRadius = appearance.primaryView.cornerRadius
        hudHolder.clipsToBounds = true
        
        self.addSubview(hudMask)
        self.addSubview(hudHolder)
        
        hudHolder.addSubview(icon)
        hudHolder.addSubview(label)
        
        constrain(hudMask, self.superview!) { view, superview in
            view.edges == superview.edges
        }
        
        constrain(hudHolder, self.superview!, replace: constraintsGroup) { view, superview in
            view.centerY == superview.centerY
            view.centerX == superview.centerX
        }
        
        constrain(self, self.superview!) { view, superview in
            view.edges == superview.edges
        }
        
        constrain(hudHolder, icon, label) { hudHolder, icon, label in
            
            icon.centerX == hudHolder.centerX
            icon.top == hudHolder.top + appearance.margins
            
            icon.width == 50
            icon.height == 50
            
            label.top == icon.bottom + appearance.interItemSpacing
            label.right == hudHolder.right - appearance.margins
            label.left == hudHolder.left + appearance.margins
            label.bottom == hudHolder.bottom - appearance.margins
            label.width == 150
        }
        
        layoutIfNeeded()
        
        icon.clipsToBounds = true
        icon.contentMode = .scaleAspectFit
        label.textAlignment = .center
        label.textColor = DSAppearance.shared.main.primaryView.text.title1
        label.font = DSAppearance.shared.main.fonts.title1
    }
    
    /// Show popup
    /// - Parameters:
    ///   - message: Message you want to show
    ///   - successColor: Use green color or not
    ///   - timeOut: Hide popup after time out
    ///   - iconImage: Icon to show
    ///   - completion: Completion handler
    func show(message: String, type: DSMessageType, timeOut: Double, icon iconImage: UIImage? = nil, completion: (() -> Void)? = nil) {
        
        let appearance = DSAppearance.shared.main
        
        label.text = message
        let words = message.components(separatedBy: " ").count
        
        if words == 1 {
            label.font = appearance.fonts.headline.withSize(21)
        } else if words == 2 {
            label.font = appearance.fonts.headline.withSize(19)
        } else if words <= 5 {
            label.font = appearance.fonts.headline.withSize(17)
        } else {
            label.font = appearance.fonts.headline.withSize(14)
        }
        
        icon.tintColor = DSAppearance.shared.main.brandColor
        
        switch type {
        case .default:
            icon.tintColor = appearance.brandColor
            icon.image = iconImage ?? UIImage(systemName: "message.fill")
        case .success:
            icon.tintColor = appearance.semanticGreenColor
            icon.image = iconImage ?? UIImage(systemName: "checkmark.circle.fill")
        case .warning:
            icon.tintColor = UIColor.systemYellow
            icon.image = iconImage ?? UIImage(systemName: "exclamationmark.octagon.fill")
        case .error:
            icon.tintColor = UIColor.systemRed
            icon.image = iconImage ?? UIImage(systemName: "info.circle.fill")
        }
        
        showHidePopUp(timeOut: timeOut, completion: completion)
    }
    
    /// Show / Hide popup
    /// - Parameters:
    ///   - timeOut: Double
    ///   - completion: Completion handler
    private func showHidePopUp(timeOut: Double, completion: (() -> Void)? = nil) {
        
        showPopUpAnimation()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + timeOut + 1) { [unowned self] in
            hidePopUpAnimation(completion: completion)
        }
    }
    
    /// Show current popup configuration over current superview
    private func showPopUpAnimation() {
        
        guard let superview = self.superview else {
            return
        }
        
        superview.isUserInteractionEnabled = false
        
        constrain(hudHolder, superview, replace: constraintsGroup) { view, superview in
            view.centerY == superview.centerY + 150
            view.centerX == superview.centerX
        }
        
        layoutSubviews()
        
        superview.bringSubviewToFront(self)
        
        constrain(hudHolder, self.superview!, replace: constraintsGroup) { view, superview in
            view.centerY == superview.centerY - 50
            view.centerX == superview.centerX
        }
        
        UIView.animate(withDuration: 0.4,
                       delay: 0,
                       usingSpringWithDamping: 0.9,
                       initialSpringVelocity: 0.6,
                       options: .curveEaseInOut, animations: { [unowned self] in
                        
                        hudHolder.alpha = 1
                        hudMask.alpha = 0.5
                        layoutSubviews()
                       }) { done in
            
            if done {
                self.icon.bounce()
            }
        }
    }
    
    /// Hide popup from current superview
    /// - Parameter completion: Completion handler
    func hidePopUpAnimation(completion: (() -> Void)? = nil) {
        
        guard let superview = self.superview else {
            return
        }
        
        constrain(hudHolder, superview, replace: constraintsGroup) { view, superview in
            view.centerY == superview.centerY + 150
            view.centerX == superview.centerX
        }
        
        UIView.animate(withDuration: 0.4,
                       delay: 0,
                       usingSpringWithDamping: 0.9,
                       initialSpringVelocity: 0.4,
                       options: .curveEaseInOut, animations: { [unowned self] in
                        
                        hudHolder.alpha = 0
                        hudMask.alpha = 0
                        layoutSubviews()
                        
                       }, completion: { done in
                        
                        guard done else { return }
                        superview.isUserInteractionEnabled = true
                        completion?()
                       })
    }
}
