//
//  UIPageControlExtension.swift
//  DSKit
//
//  Created by Borinschi Ivan on 09.12.2020.
//  Copyright © 2021 Borinschi Ivan. All rights reserved.
//

import UIKit

extension UIPageControl {
    
    func updateAppearance() {
        let appearance = DSAppearance.shared.main
        backgroundColor = appearance.primaryView.background
        pageIndicatorTintColor = appearance.brandColor.lighten(.C500)
        currentPageIndicatorTintColor = appearance.brandColor
    }
}
