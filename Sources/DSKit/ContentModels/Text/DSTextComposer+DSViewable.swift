//
//  DSText.swift
//  DSKit
//
//  Created by Borinschi Ivan on 14.01.2021.
//  Copyright © 2021 Borinschi Ivan. All rights reserved.
//

import UIKit

extension DSTextComposer: DSViewable {

    func view(_ designableViewColors: DSDesignableViewColors) -> UIView {
        let label = UILabel()
        label.set(text: self, designableTextColor: designableViewColors.text)
        return label
    }
}
