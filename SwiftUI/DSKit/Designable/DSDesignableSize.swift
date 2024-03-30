//
//  DSDesignableLayout.swift
//  DSKitCore
//
//  Created by Ivan Borinschi on 09.02.2023.
//

import Foundation
import UIKit

public protocol DSDesignableSize {    
    func number(for: DSSpacingDimension) -> CGFloat
}
