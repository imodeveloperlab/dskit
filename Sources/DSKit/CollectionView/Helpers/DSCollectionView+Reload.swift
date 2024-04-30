//
//  DSCollectionView+Reload.swift
//  DSKit
//
//  Created by Borinschi Ivan on 02.02.2021.
//  Copyright © 2021 Borinschi Ivan. All rights reserved.
//

import Foundation

extension DSCollectionView {
    
    /// Reload content
    /// - Parameters:
    ///   - newContent: New content to show
    ///   - scrollToBottom: Scroll to bottom after reload, default is `false`
    func reload(content newContent: [DSSection], animated: Bool = false, scrollToBottom: Bool = false) {
        show(content: newContent, animated: animated, scrollToBottom: scrollToBottom)
    }
    
    /// Reload current content
    /// - Parameter scrollToBottom: Scroll to bottom after reload, default is `false`
    func reload(scrollToBottom: Bool = false, animated: Bool = false) {
        self.reload(content: self.originalContent, animated: animated, scrollToBottom: scrollToBottom)
    }
}
