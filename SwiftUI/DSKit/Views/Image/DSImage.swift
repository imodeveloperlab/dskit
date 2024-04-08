//
//  UIButtonExtension.swift
//  DSKit
//
//  Created by Borinschi Ivan on 22.12.2020.
//  Copyright © 2021 Borinschi Ivan. All rights reserved.
//

import UIKit
import SwiftUI

public enum DSImageContentType {
    case system(name: String)
    case image(image: UIImage?)
    case imageURL(url: URL?)
}

public struct DSImage {
    
    public var displayShape: DSDisplayShape
    public var content: DSImageContentType
    public var contentMode: DSContentMode
    public var size: DSSize
    public var tintColor: DSColor?
    
    public init(
        content: DSImageContentType,
        displayShape: DSDisplayShape = .none,
        size: DSSize,
        tintColor: DSColor? = nil,
        contentMode: DSContentMode = .scaleAspectFit
    ) {
        self.content = content
        self.displayShape = displayShape
        self.tintColor = tintColor
        self.size = size
        self.contentMode = contentMode
    }
    
    public init(
        systemName: String,
        displayShape: DSDisplayShape = .none,
        size: DSSize,
        tintColor: DSColor? = nil,
        contentMode: DSContentMode = .scaleAspectFit
    ) {
        self.init(
            content: .system(name: systemName),
            displayShape: displayShape,
            size: size,
            tintColor: tintColor,
            contentMode: contentMode
        )
    }
    
    public init(
        named: String,
        displayShape: DSDisplayShape = .none,
        size: DSSize,
        tintColor: DSColor? = nil,
        contentMode: DSContentMode = .scaleAspectFit
    ) {
        self.init(
            content: .image(image: UIImage(named: named)),
            displayShape: displayShape,
            size: size,
            tintColor: tintColor,
            contentMode: contentMode
        )
    }
    
    public init(
        uiImage: UIImage?,
        displayShape: DSDisplayShape = .none,
        size: DSSize = .fillUpTheSpace,
        tintColor: DSColor? = nil,
        contentMode: DSContentMode = .scaleAspectFit
    ) {
        self.init(
            content: .image(image: uiImage),
            displayShape: displayShape,
            size: size,
            tintColor: tintColor,
            contentMode: contentMode
        )
    }
    
    public init(
        imageURL: URL?,
        displayShape: DSDisplayShape = .none,
        size: DSSize = .fillUpTheSpace,
        tintColor: DSColor? = nil,
        contentMode: DSContentMode = .scaleAspectFit
    ) {
        self.init(
            content: .imageURL(url: imageURL),
            displayShape: displayShape,
            size: size,
            tintColor: tintColor,
            contentMode: contentMode
        )
    }
}

extension DSImage {
    func imageWith(tint tintColor: DSColor) -> DSImage {
        var image = self
        image.tintColor = tintColor
        return image
    }
}
