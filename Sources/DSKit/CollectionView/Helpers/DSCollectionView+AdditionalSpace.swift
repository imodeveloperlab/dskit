//
//  DSCollectionView+AdditionalSpace.swift
//  DSKit
//
//  Created by Borinschi Ivan on 14.02.2021.
//  Copyright © 2021 Borinschi Ivan. All rights reserved.
//

import UIKit

extension DSCollectionView {
    
    /// Add additional content space, will add an additional content section with a space view model in it
    /// to already existing content in this collection
    /// - Parameter space: CGFloat
    func setBottomAdditionalSpace(space: CGFloat) {
        
        additionalBottomContentSpace = space
        updateContent(animated: true, scrollToBottom: false)
        updateScrollIndicatorInsets()
    }
    
    /// Remove bottom space
    func removeBottomAdditionalSpace() {
        additionalBottomContentSpace = 0
        show(content: self.originalContent, animated: false)
        updateScrollIndicatorInsets()
    }
    
    /// Add additional content space, will add an additional content section with a space view model in it
    /// to already existing content in this collection
    /// - Parameter space: CGFloat
    func setTopAdditionalSpace(space: CGFloat) {
        
        additionalTopContentSpace = space
        updateContent(animated: true, scrollToBottom: false)
        updateScrollIndicatorInsets()
    }
    
    /// Remove top space
    func removeTopAdditionalSpace() {
        
        additionalTopContentSpace = 0
        show(content: self.originalContent, animated: false)
        updateScrollIndicatorInsets()
    }
    
    func updateScrollIndicatorInsets() {
        view.scrollIndicatorInsets = UIEdgeInsets(top: additionalTopContentSpace, left: 0, bottom: additionalBottomContentSpace, right: 0)
    }
}
