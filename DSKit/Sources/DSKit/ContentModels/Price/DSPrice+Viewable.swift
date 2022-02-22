//
//  DSPrice+Viewable.swift
//  DSKit
//
//  Created by Borinschi Ivan on 22.02.2021.
//  Copyright © 2021 Borinschi Ivan. All rights reserved.
//

import UIKit

extension DSPrice: DSViewable {
    
    func view(_ designableViewColors: DSDesignableViewColors) -> UIView {
        
        let label = UILabel()
        let composer = DSTextComposer()
        composer.add(price: self)
        label.set(text: composer, designableTextColor: designableViewColors.text)
        return label
    }
}
