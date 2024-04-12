//
//  DSViewController+ShowBottomContent.swift
//  DSKit
//
//  Created by Borinschi Ivan on 02.02.2021.
//  Copyright © 2021 Borinschi Ivan. All rights reserved.
//

public extension DSViewController {
    
    /// Display content on the top part of the screen
    /// - Parameter content: [DSViewModel]
    func showTop(content: [DSViewModel]) {
        topContentQueue.append(QueuedContent(content: [content.list()], animated: true, scrollToBottom: false))
        applyCurrentContentQueueIfPossible()
    }
    
    /// Display content on the top part of the screen
    /// - Parameters:
    ///   - newContent: DSSection
    ///   - animated: animated `default is true`
    func showTop(content newContent: DSSection, animated: Bool = true) {
        topContentQueue.append(QueuedContent(content: [newContent], animated: animated, scrollToBottom: false))
        applyCurrentContentQueueIfPossible()
    }
    
    /// Display content on the top part of the screen
    /// - Parameters:
    ///   - newContent: [DSSection]
    ///   - animated: animated `default is true`
    func showTop(content newContent: [DSSection], animated: Bool = true) {
        topContentQueue.append(QueuedContent(content: newContent, animated: animated, scrollToBottom: false))
        applyCurrentContentQueueIfPossible()
    }
    
    /// Hide top content
    func hideTopContent() {
        topCollectionView.show(content: [[DSViewModel]().list()])
        if collectionView.additionalTopContentSpace != 0 {
            adaptTopContentToNewHeight(height: 0)
        }
    }
}
