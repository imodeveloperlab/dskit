//
//  DSViewController+ShowBottomContent.swift
//  DSKit
//
//  Created by Borinschi Ivan on 02.02.2021.
//  Copyright © 2021 Borinschi Ivan. All rights reserved.
//

import Foundation

public extension DSViewController {
    
    /// Display content on the bottom part of the screen
    /// - Parameter content: View model to be displayed
    func showBottom(content: DSViewModel) {
        
        bottomContentQueue.append(QueuedContent(content: [[content].list()],
                                                    animated: false,
                                                    scrollToBottom: false))
        applyCurrentContentQueueIfPossible()
    }
    
    /// Display content on the bottom part of the screen
    /// - Parameter content: View model to be displayed
    func showBottom(content: [DSViewModel]) {
        
        bottomContentQueue.append(QueuedContent(content: [content.list()],
                                                    animated: false,
                                                    scrollToBottom: false))
        applyCurrentContentQueueIfPossible()
    }
    
    /// Display content on the bottom part of the screen
    /// - Parameters:
    ///   - newContent: DSSection
    ///   - animated: animated `default is true`
    func showBottom(content newContent: DSSection, animated: Bool = true) {
        
        bottomContentQueue.append(QueuedContent(content: [newContent],
                                                    animated: animated,
                                                    scrollToBottom: false))
        applyCurrentContentQueueIfPossible()
    }
    
    /// Display content on the bottom part of the screen
    /// - Parameters:
    ///   - newContent: [DSSection]
    ///   - animated: animated `default is true`
    func showBottom(content newContent: [DSSection], animated: Bool = true) {
        
        bottomContentQueue.append(QueuedContent(content: newContent,
                                                    animated: animated,
                                                    scrollToBottom: false))
        applyCurrentContentQueueIfPossible()
    }
    
    /// Hide bottom content
    func hideBottomContent() {
        
        bottomCollectionView.show(content: [[DSViewModel]().list()])
        if collectionView.additionalBottomContentSpace != 0 {
            adaptBottomContentToNewHeight(height: 0)
        }
    }
}
