//
//  DSSection+Identifiers.swift
//  DSKit
//
//  Created by Borinschi Ivan on 15.02.2021.
//  Copyright © 2021 Borinschi Ivan. All rights reserved.
//

import Foundation

extension Array where Element == DSSection {
    
    /// Adapt identifiers for each view model in a way that we never
    /// will have a view model that have same identifier as other one
    /// - Parameter content: [DSSection]
    /// - Returns: Updated sections with view models
    func prepareViewModelsIdentifiers() {
        updateIdentifierFromModelIndexAndTypeIfNeed()
        updateRandomIdentifierIfNeed()
    }
    
    fileprivate func getDuplicatesHashes() -> [String] {
        
        /// Map all view models `hashValues` into an array  of strings
        let hashValues = self.map { (section) -> [String] in
            section.viewModels.map { (model) -> String in
                return model.hash()
            }
        }.flatMap({ $0 })
        
        /// Filter and get all duplicates
        return Dictionary(grouping: hashValues, by: {$0}).filter { $1.count > 1 }.keys.map { (key) -> String in
            return key
        }
    }
    
    /// Index path identifier
    fileprivate func updateIdentifierFromModelIndexAndTypeIfNeed() {
        
        let duplicates = getDuplicatesHashes()
        
        // Try to generate an identifier from model index and type
        if !duplicates.isEmpty {
            for (_, section) in self.enumerated() {
                for (modelIndex, model) in section.viewModels.enumerated() {
                    if duplicates.contains(model.hash()) {
                        var model = model
                        model.identifier = "Row" + modelIndex.string() + model.style.displayStyle.rawValue
                        section.viewModels[modelIndex] = model
                    }
                }
            }
        }
    }
    
    /// Random identifier
    fileprivate func updateRandomIdentifierIfNeed() {
        
        let duplicates = getDuplicatesHashes()
        
        if !duplicates.isEmpty {
            for (_, section) in self.enumerated() {
                for (modelIndex, model) in section.viewModels.enumerated() {
                    if duplicates.contains(model.hash()) {
                        var model = model
                        model.identifier = Int.random(in: 1...9000000000).string()
                        section.viewModels[modelIndex] = model
                    }
                }
            }
        }
    }
}
