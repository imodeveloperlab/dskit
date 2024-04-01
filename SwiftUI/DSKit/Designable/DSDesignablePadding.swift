//
//  DSDesignablePadding.swift
//  DSKit
//
//  Created by Ivan Borinschi on 09.02.2023.
//

import Foundation
import UIKit

public protocol DSDesignablePadding {
    func value(for: DSPadding) -> CGFloat
}
