//
//  DSTextFieldValue.swift
//  DSKit
//
//  Created by Ivan Borinschi on 29.12.2022.
//

import Foundation

public final class DSTextFieldValue: ObservableObject, Hashable {
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    public static func == (lhs: DSTextFieldValue, rhs: DSTextFieldValue) -> Bool {
        lhs.id == rhs.id
    }
    
    let id = UUID()
    
    public init(value: String = "") {
        self.text = value
    }
    
    // The current text of the text field
    @Published public var text: String = ""
    
    // Indicates whether the current text value is valid according to validation rules
    @Published public var isValid: Bool = true
    
    // Closure for custom validation logic, can be set by the parent view
    var validationClosure: (() -> Void)?
    
    public func validate() -> Bool {
        validationClosure?()
        return isValid
    }
}

public extension Array where Element == DSTextFieldValue {
    @discardableResult func validate() -> Bool {
        for field in self {
            let isValid = field.validate()
            if !isValid {
                return false
            }
        }
        return true
    }
}
