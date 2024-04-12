//
//  DSViewController+SourceCode.swift
//  DSKit
//
//  Created by Borinschi Ivan on 25.01.2021.
//

import DSKit
import UIKit

public extension DSViewController {
    
    /// Action view model
    /// - Parameters:
    ///   - title: String
    ///   - description: String?
    ///   - icon: String?
    /// - Returns: DSActionVM
    func action(title: String,
                description: String? = nil,
                icon: String? = nil) -> DSActionVM {
        
        // Text
        let text = DSTextComposer()
        text.add(type: .headline, text: title, spacing: 5)
        if let description = description {
            text.add(type: .caption1, text: description)
        }
        
        // Action
        var action = text.actionViewModel()
        
        // Icon
        if let icon = icon {
            action.leftIcon(sfSymbolName: icon)
        }
        
        action.rightArrow()
        return action
    }
    
    /// Section
    /// - Parameters:
    ///   - header: String
    ///   - viewModels: [DSViewModel]
    /// - Returns: DSSection
    func section(header: String, for viewModels: [DSViewModel]) -> DSSection {        
        return viewModels.list().headlineHeader(header, size: 14)
    }
    
    /// Description section
    /// - Parameter text: String
    /// - Returns: DSSection
    func descriptionSection(_ text: String) -> DSSection {
        
        let description = DSLabelVM(.subheadline, text: text)
        return description.list()
    }
}
