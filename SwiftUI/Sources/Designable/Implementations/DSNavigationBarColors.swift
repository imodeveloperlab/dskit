//
//  DSNavigationBarAppearance.swift
//  DSKit
//
//  Created by Borinschi Ivan on 01.12.2020.
//  Copyright © 2021 Borinschi Ivan. All rights reserved.
//

import UIKit
import SwiftUI

public struct DSNavigationBarAppearance: DSNavigationBarAppearanceProtocol {
    public init(
        buttons: UIColor,
        text: UIColor,
        bar: UIColor,
        translucent: Bool = false
    ) {
        self.buttons = buttons
        self.text = text
        self.bar = bar
        self.translucent = translucent
    }
    
    public var buttons: UIColor
    public var text: UIColor
    public var bar: UIColor
    public var translucent: Bool
}

