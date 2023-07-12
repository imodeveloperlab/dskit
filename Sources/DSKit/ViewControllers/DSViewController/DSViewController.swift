//
//  DSViewController.swift
//  DSKit
//
//  Created by Borinschi Ivan. on 02.12.2020.
//  Copyright © 2021 Borinschi Ivan. All rights reserved.
//  
//

import UIKit
import Combine

open class DSViewController: DSCollectionViewController {
    
    struct QueuedContent {
        let content: [DSSection]
        let animated: Bool
        let scrollToBottom: Bool
    }
    
    var topContentQueue = [QueuedContent]()
    var centerContentQueue = [QueuedContent]()
    var bottomContentQueue = [QueuedContent]()
    var decorationIconView: UIView?
    
    /// Show a sf symbol icon under content view on the screen
    public var decorationIcon = DSDecorationIcon() {
        didSet {
            updateDecorationIconView()
        }
    }
    
    // MARK: - Lifecycle
    override open func viewDidLoad() {
        super.viewDidLoad()
        //DSAppearance.shared.appearancePublisher.subscribe(self)
    }
    
    open override func appearanceDidUpdate() {
        super.appearanceDidUpdate()
        reloadAllContent()
    }
    
    open override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        
        /// If current traitCollection is not equal to lastTraitCollection then reload all content
        if traitCollection.userInterfaceStyle != lastTraitCollection?.userInterfaceStyle {
            lastTraitCollection = traitCollection
            reloadAllContent()
        }
    }
    
    /// If traitCollection did change reload all collections content, to update the ui for new appearances
    /// - Parameter previousTraitCollection: UITraitCollection?
    open override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        
        super.traitCollectionDidChange(previousTraitCollection)
        guard UIApplication.shared.applicationState == .inactive else {
            return
        }
        
        lastTraitCollection = traitCollection
        reloadAllContent()
    }
    
    open override func viewSafeAreaInsetsDidChange() {
        super.viewSafeAreaInsetsDidChange()
        applyCurrentContentQueueIfPossible()
    }
    
    public func reloadAllContent() {
        
        if topCollectionView !== nil {
            topCollectionView.reload()
        }
        
        if topCollectionView !== nil {
            topCollectionView.reload()
        }
        
        if topCollectionView !== nil {
            topCollectionView.reload()
        }
    }
    
    func applyCurrentContentQueueIfPossible() {
        if ProcessInfo.processInfo.arguments.contains("TEST_MODE")  {
            showContentAllIfNeed()
        } else {
            NSObject.cancelPreviousPerformRequests(withTarget: self)
            self.perform(#selector(showContentAllIfNeed), with: nil, afterDelay: 0.05)
        }
    }
    
    // All content
    @objc private func showContentAllIfNeed() {
        showTopContentIfNeed()
        showCenterContentIfNeed()
        showBottomContentIfNeed()
    }
    
    // Top content
    func showTopContentIfNeed() {
        
        guard let topCollectionView = topCollectionView, let display = topContentQueue.last else {
            return
        }
        
        topCollectionView.show(content: display.content,
                               animated: display.animated,
                               scrollToBottom: display.scrollToBottom)
        
        topContentQueue.removeAll()
    }
    
    // Center content
    func showCenterContentIfNeed() {
        
        guard let collectionView = collectionView, let display = centerContentQueue.last else {
            return
        }
        
        collectionView.show(content: display.content,
                            animated: display.animated,
                            scrollToBottom: display.scrollToBottom)
        
        centerContentQueue.removeAll()
    }
    
    // Bottom content
    func showBottomContentIfNeed() {
        
        guard let bottomCollectionView = bottomCollectionView, let display = bottomContentQueue.last else {
            return
        }
        
        bottomCollectionView.show(content: display.content,
                                  animated: display.animated,
                                  scrollToBottom: display.scrollToBottom)
        
        bottomContentQueue.removeAll()
    }
    
    /// Set bounce content to true or false
    /// default YES. if YES, bounces past edge of content and back again
    /// - Parameter state: Bool
    public func setBounceContentTo(_ state: Bool) {
        collectionView.view.bounces = state
    }
    
    /// Set bounce content to true or false
    /// default `YES`. turn off any dragging temporarily
    /// - Parameter state: Bool
    public func setIsScrollEnabled(_ state: Bool) {
        collectionView.view.isScrollEnabled = state
    }
}

