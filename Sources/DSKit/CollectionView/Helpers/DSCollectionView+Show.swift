//
//  DSCollectionView+Reload.swift
//  DSKit
//
//  Created by Borinschi Ivan on 02.02.2021.
//  Copyright © 2021 Borinschi Ivan. All rights reserved.
//

import UIKit

extension DSCollectionView {
    
    /// Update content
    /// - Parameters:
    ///   - animated: Bool
    ///   - scrollToBottom: Bool
    func updateContent(animated: Bool, scrollToBottom: Bool) {
        
        var animated = animated
        
        // If we are in test mode, then update without animation
        if ProcessInfo.processInfo.arguments.contains("TEST_MODE") {
            animated = false
        }
        
        // Prepare content to be displayed
        self.adaptedContent = prepareContentToBeDisplayed(originalContent)
        
        // Create new snapshot for content
        self.snapshot = NSDiffableDataSourceSnapshot<DSDiffableSection, DSViewModelDataSource>()
        
        // Store the used hashes, to be able
        // to check if this hash is used or not
        // each section should contain only uniq
        // identifiers, which we compose from section
        // view models hashes
        var alreadyUsedHashes = [Int]()
        
        // Set up snapshot
        for (index, section) in adaptedContent.enumerated() {
            
            // Map view models in to DSViewModelDataSource
            let displayModels = section.viewModels.map { (model) -> DSViewModelDataSource in
                DSViewModelDataSource(model: model)
            }
            
            if let identifier = section.identifier?.hash, !alreadyUsedHashes.contains(identifier) {
                
                // Set diffable hash from section identifier
                alreadyUsedHashes.append(identifier)
                snapshot?.appendSections([.section(id: identifier)])
                
                // If section section.diffableHash is no contained in
                // alreadyUsedHashes then we ca use it as id
            } else if !alreadyUsedHashes.contains(section.diffableHash) {
                
                // Set diffable hash from section
                let identifier = section.diffableHash
                alreadyUsedHashes.append(identifier)
                snapshot?.appendSections([.section(id: identifier)])
                
            } else {
                
                // If we can't get uniq hash identifier from
                // section diffableHash then we will generate one
                // from current section index and section type
                let identifier = section.hashValue + index
                
                alreadyUsedHashes.append(identifier)
                snapshot?.appendSections([.section(id: identifier)])
            }
            
            snapshot?.appendItems(displayModels)
        }
        
        self.applySnapshot(animated: animated, scrollToBottom: scrollToBottom)
    }
    
    func applySnapshot(animated: Bool, scrollToBottom: Bool) {
        
        guard let snapshot = self.snapshot else {
            return
        }
        
        // Apply new snapshot
        dataSource.apply(snapshot, animatingDifferences: animated, completion: {
            
            // Scroll to bottom after completion
            if scrollToBottom {
                self.scrollToBottom(animated: true)
            }
            
            self.contentSizeDidUpdate?(self.view.contentSize)
        })
    }
    
    /// Show content in collection view
    /// - Parameters:
    ///   - newContent: Content to show
    ///   - animated: Update differences animated or not, default is `true`
    ///   - scrollToBottom: Scroll to bottom after content have been shown on the screen, default is `false`
    public func show(content newContent: [DSSection], animated: Bool = true, scrollToBottom: Bool = false) {
        
        self.originalContent.removeAll()
        self.originalContent.append(contentsOf: newContent)
        self.updateContent(animated: animated, scrollToBottom: scrollToBottom)
    }
    
    /// Prepare content to be displayed
    /// - Parameter content: [DSSection]
    /// - Returns: [DSSection]
    func prepareContentToBeDisplayed(_ content: [DSSection]) -> [DSSection] {
        
        var adaptedContent = [DSSection]()
        adaptedContent.append(contentsOf: content)
        
        // Add additional top space
        if additionalTopContentSpace != 0 {
            var space = DSSpaceVM(type: .custom(additionalTopContentSpace))
            space.identifier = "AdditionalTopSpace"
            let section = space.list()
            section.identifier = "AdditionalTopSpaceSection"
            section.zeroTopBottomInset()
            adaptedContent.insert(section, at: 0)
        }
        
        // Check if additional space should be added to bottom of the screen
        let safeArea = UIApplication.shared.topMostViewController()?.view.safeAreaInsets.bottom ?? 0
                
        let containSafeArea = safeArea > 0
        let shouldAddSpace = (position == .bottom && containSafeArea)        
        
        // Append bottom space section
        if adaptedContent.totalViewModelsCount > 0 && !shouldAddSpace {
            
            if let topInsetsOfFirstSection = content.first?.insets.top {
                
                let space = DSSpaceVM(type: .custom(topInsetsOfFirstSection))
                let section = space.list(identifier: "AdditionalBottomContentSpaceMargin")
                section.identifier = "AdditionalBottomContentSpaceMargin"
                section.zeroTopBottomInset()
                adaptedContent.append(section)
                
            } else {
                
                let space = DSSpaceVM()
                let section = space.list(identifier: "AdditionalBottomContentSpaceMargin")
                section.identifier = "AdditionalBottomContentSpaceMargin"
                section.zeroTopBottomInset()
                adaptedContent.append(section)
            }
            
        } else if adaptedContent.totalViewModelsCount > 0 && shouldAddSpace {
         
            let space = DSSpaceVM()
            let section = space.list(identifier: "AdditionalBottomContentSpaceMargin")
            section.identifier = "AdditionalBottomContentSpaceMargin"
            section.zeroTopBottomInset()
            adaptedContent.append(section)
        }
        
        adaptedContent = adaptedContent.filter { (section) -> Bool in
            return !section.viewModels.isEmpty
        }
        
        // Add additional bottom space
        if additionalBottomContentSpace != 0 {
            var space = DSSpaceVM(type: .custom(additionalBottomContentSpace))
            space.identifier = "AdditionalBottomSpace"
            let section = space.list()
            section.identifier = "AdditionalBottomSpaceSection"
            section.zeroTopBottomInset()
            adaptedContent.append(section)
        }
        
        // Prepare content before show
        adaptedContent.prepareViewModelsDisplayStyle()
        adaptedContent.prepareViewModelsIdentifiers()
        
        return adaptedContent
    }
}
