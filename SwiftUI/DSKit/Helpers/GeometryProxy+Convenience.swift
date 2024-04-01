//
//  GeometryProxy+Convenience.swift
//  DSKit
//
//  Created by Ivan Borinschi on 08.02.2023.
//

import SwiftUI

extension GeometryProxy {
    func height(forPercentage percentage: CGFloat) -> CGFloat {
        return self.size.height * (percentage / 100)
    }
}
