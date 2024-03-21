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
    case sfSymbol(name: String)
    case image(image: UIImage?)
    case imageURL(url: URL?)
}

public struct DSImage {
    
    public var displayShape: DSDisplayShape
    public var content: DSImageContentType
    public var contentMode: DSContentMode
    public var size: DSSize
    public var tintColor: DSTintColor
    
    public init(
        content: DSImageContentType,
        displayShape: DSDisplayShape = .none,
        size: DSSize,
        tintColor: DSTintColor = .none,
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
        size: DSSize,
        tintColor: DSTintColor = .none,
        contentMode: DSContentMode = .scaleAspectFit
    ) {
        self.init(
            content: .sfSymbol(name: sfSymbolName),
            displayShape: displayShape,
            size: size,
            tintColor: tintColor,
            contentMode: contentMode
        )
    }
    
    public init(
        uiImageName: String,
        displayShape: DSDisplayShape = .none,
        size: DSSize,
        tintColor: DSTintColor = .none,
        contentMode: DSContentMode = .scaleAspectFit
    ) {
        self.init(
            content: .image(image: UIImage(named: uiImageName)),
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
        tintColor: DSTintColor = .none,
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
        tintColor: DSTintColor = .none,
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
    func imageWith(tint tintColor: DSTintColor) -> DSImage {
        var image = self
        image.tintColor = tintColor
        return image
    }
}
