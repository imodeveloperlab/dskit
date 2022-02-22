//
//  UIColor+String.swift
//  DSKit+AppearanceMaker
//
//  Created by Borinschi Ivan on 17.02.2021.
//  Copyright © 2021 Borinschi Ivan. All rights reserved.
//

import UIKit

extension UIColor {
    var dsDescription: String {
        let light = self.resolvedColor(with: UITraitCollection.init(userInterfaceStyle: .light))
        let dark = self.resolvedColor(with: UITraitCollection.init(userInterfaceStyle: .dark))
        return "DSColor.color(light: 0x\(light.hexRGBColor), dark: 0x\(dark.hexRGBColor))"
    }
}
