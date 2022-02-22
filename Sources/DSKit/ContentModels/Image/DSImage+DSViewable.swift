//
//  DSImage+DSViewAble.swift
//  DSKit
//
//  Created by Borinschi Ivan on 22.02.2021.
//  Copyright © 2021 Borinschi Ivan. All rights reserved.
//

import UIKit

extension DSImage: DSViewable {
    
    public func view(_ designableViewColors: DSDesignableViewColors) -> UIView {
        let imageView = UIImageView()
        imageView.setImage(self, designableViewColors: designableViewColors)
        return imageView
    }
}
