//
//  UIButtonExtension.swift
//  DSKit
//
//  Created by Borinschi Ivan on 22.12.2020.
//  Copyright © 2021 Borinschi Ivan. All rights reserved.
//

import UIKit

public struct DSImage: Equatable, Hashable {
    
    public var size: DSImageSize
    public var displayStyle: DSImageDisplayStyle
    public var content: DSImageContent
    public var contentMode: DSImageContentMode
    public var tintColor: DSImageTintColor
    
    public init(content: DSImageContent,
                displayStyle: DSImageDisplayStyle = .default,
                size: DSImageSize = .size(CGSize(width: 25, height: 25)),
                tintColor: DSImageTintColor,
                contentMode: DSImageContentMode = .scaleAspectFit) {
        
        self.content = content
        self.displayStyle = displayStyle
        self.tintColor = tintColor
        self.size = size
        self.contentMode = contentMode
    }
}

extension UIImageView {
    
    func setImage(_ image: DSImage,
                  designableViewColors: DSDesignableViewColors) {
        
        setImageContent(image.content)
        setImageTintColor(image.tintColor, designableViewColors: designableViewColors)
        setImageDisplayStyle(image.displayStyle, size: image.size, cornerRadius: designableViewColors.cornerRadius)
        setImageSize(image.size)
        setImageContentMode(image.contentMode)
    }
}
