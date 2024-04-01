//
//  DSDesignableDimension.swift
//  DSKit
//
//  Created by Ivan Borinschi on 09.02.2023.
//

import Foundation
import UIKit

public protocol DSDesignableDimension {
    func value(for: DSDimension) -> CGFloat
}
