//
//  UIButtonExtension.swift
//  DSKit
//
//  Created by Borinschi Ivan on 22.12.2020.
//  Copyright © 2021 Borinschi Ivan. All rights reserved.
//

import UIKit
import SwiftUI

public struct DSImage {
    
    public var displayShape: DSDisplayShape
    public var content: DSImageContentType
    public var contentMode: DSContentMode
    public var size: DSDimension
    public var tintColor: DSTintColor?
    
    public init(
        content: DSImageContentType,
        displayShape: DSDisplayShape = .none,
        size: DSDimension = .unspecified,
        tintColor: DSTintColor? = nil,
        contentMode: DSContentMode = .scaleAspectFit
    ) {
        self.content = content
        self.displayShape = displayShape
        self.tintColor = tintColor
        self.size = size
        self.contentMode = contentMode
    }
    
    public init(
        sfSymbolName: String,
        displayShape: DSDisplayShape = .none,
        size: DSDimension = .unspecified,
        tintColor: DSTintColor? = nil,
        contentMode: DSContentMode = .scaleAspectFit
    ) {
        self.content = .sfSymbol(name: sfSymbolName)
        self.displayShape = displayShape
        self.tintColor = tintColor
        self.size = size
        self.contentMode = contentMode
    }
}

extension DSImage {
    func imageWith(tint tintColor: DSTintColor) -> DSImage {
        var image = self
        image.tintColor = tintColor
        return image
    }
}
