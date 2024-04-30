//
//  DSViewController+ShowBottomContent.swift
//  DSKit
//
//  Created by Borinschi Ivan on 02.02.2021.
//  Copyright © 2021 Borinschi Ivan. All rights reserved.
//

import Foundation

public extension DSViewController {
    
    /// Show view model content as a list.
    /// - Parameters:
    ///   - newContent: DSViewModel
    ///   - animated: should differences be animated
    ///   - scrollToBottom: should scroll to bottom after content has been updated
    func show(content newContent: DSViewModel, animated: Bool = true, scrollToBottom: Bool = false) {
        
        centerContentQueue.append(QueuedContent(content: [newContent.list()],
                                                animated: animated,
                                                scrollToBottom: scrollToBottom))
        applyCurrentContentQueueIfPossible()
    }
    
    /// Show view model content as a list.
    /// - Parameters:
    ///   - newContent: DSViewModel
    ///   - animated: should differences be animated
    ///   - scrollToBottom: should scroll to bottom after content has been updated
    func show(content newContent: DSViewModel..., animated: Bool = true, scrollToBottom: Bool = false) {
        
        centerContentQueue.append(QueuedContent(content: [newContent.list()],
                                                animated: animated,
                                                scrollToBottom: scrollToBottom))
        applyCurrentContentQueueIfPossible()
    }
    
    /// Show array of view models as a list
    /// - Parameters:
    ///   - newContent: DSViewModel
    ///   - animated: should differences be animated
    ///   - scrollToBottom: should scroll to bottom after content has been updated
    func show(content newContent: [DSViewModel], animated: Bool = true, scrollToBottom: Bool = false) {
        
        centerContentQueue.append(QueuedContent(content: [newContent.list()],
                                                animated: animated,
                                                scrollToBottom: scrollToBottom))
        applyCurrentContentQueueIfPossible()
    }
    
    /// Show section
    /// - Parameters:
    ///   - newContent: DSSection
    ///   - animated: should differences be animated
    ///   - scrollToBottom: should scroll to bottom after content has been updated
    func show(content newContent: DSSection, animated: Bool = true, scrollToBottom: Bool = false) {
        
        centerContentQueue.append(QueuedContent(content: [newContent],
                                                animated: animated,
                                                scrollToBottom: scrollToBottom))
        applyCurrentContentQueueIfPossible()
    }
    
    /// Show sections
    /// - Parameters:
    ///   - newContent: DSSection
    ///   - animated: should differences be animated
    ///   - scrollToBottom: should scroll to bottom after content has been updated
    func show(content newContent: DSSection..., animated: Bool = true, scrollToBottom: Bool = false) {
        
        centerContentQueue.append(QueuedContent(content: newContent,
                                                animated: animated,
                                                scrollToBottom: scrollToBottom))
        applyCurrentContentQueueIfPossible()
    }
    
    /// Show array of sections
    /// - Parameters:
    ///   - newContent: [DSSection]
    ///   - animated: should differences be animated
    ///   - scrollToBottom: should scroll to bottom after content has been updated
    func show(content newContent: [DSSection], animated: Bool = true, scrollToBottom: Bool = false) {
        
        centerContentQueue.append(QueuedContent(content: newContent,
                                                animated: animated,
                                                scrollToBottom: scrollToBottom))
        applyCurrentContentQueueIfPossible()
    }
    
    /// Hide content
    /// - Parameter animated: Default is true
    func hideContent(animated: Bool = true) {
        
        centerContentQueue.append(QueuedContent(content: [DSSection](),
                                                animated: animated,
                                                scrollToBottom: false))
        applyCurrentContentQueueIfPossible()
    }
}
