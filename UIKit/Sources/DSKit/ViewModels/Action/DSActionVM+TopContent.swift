//
//  DSActionVM+LeftContent.swift
//  DSKit
//
//  Created by Borinschi Ivan on 03.02.2021.
//  Copyright © 2021 Borinschi Ivan. All rights reserved.
//

import UIKit

public extension DSActionVM {
    
    /// Set action top image with UIImage
    /// - Parameters:
    ///   - image: UIImage
    ///   - height: DSImageHeight
    ///   - contentMode: DSImageContentMode
    mutating func topImage(image: UIImage?,
                           height: DSImageHeight = .unknown,
                           contentMode: DSImageContentMode = .scaleAspectFill) {
        
        self.topImage = DSImageContent.image(image: image)
        self.topImageContentMode = contentMode
        self.topImageHeight = height
    }
    
    /// Set action top image with URL?
    /// - Parameters:
    ///   - url: URL?
    ///   - height: DSImageHeight
    ///   - contentMode: DSImageContentMode
    mutating func topImage(url: URL?,
                           height: DSImageHeight = .unknown,
                           contentMode: DSImageContentMode = .scaleAspectFill) {
        
        self.topImage = DSImageContent.imageURL(url: url)
        self.topImageContentMode = contentMode
        self.topImageHeight = height
    }
}
