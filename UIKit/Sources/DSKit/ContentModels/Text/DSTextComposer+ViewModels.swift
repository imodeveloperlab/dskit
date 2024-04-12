//
//  DSTextComposer+ViewModels.swift
//  DSKit
//
//  Created by Borinschi Ivan on 05.02.2021.
//  Copyright © 2021 Borinschi Ivan. All rights reserved.
//

import Foundation

public extension DSTextComposer {
 
    /// Get text view model from composer
    /// - Returns: DSTextVM
    func textViewModel() -> DSLabelVM {
        return DSLabelVM(composer: self)
    }
    
    /// Get action view model from composer
    /// - Returns: DSTextVM
    func actionViewModel() -> DSActionVM {
        return DSActionVM(composer: self)
    }
    
    /// Checkbox Action ViewModel
    /// - Parameter selected: Bool
    /// - Returns: DSActionVM
    func checkboxActionViewModel(selected: Bool) -> DSActionVM {
        
        let appearance = DSAppearance.shared.main
        let icon = selected ? "checkmark.circle.fill" : "circle"
        let color = selected ? appearance.semanticGreenColor : appearance.secondaryView.text.subheadline.withAlphaComponent(0.5)
        
        var action = DSActionVM(composer: self)
        action.rightIcon(sfSymbolName: icon, style: selected ? .custom(size: 15, weight: .medium) : .custom(size: 12, weight: .light), tintColor: .custom(color))
        return action
    }
}
