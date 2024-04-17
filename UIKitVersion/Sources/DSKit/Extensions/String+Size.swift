//
//  StringExtensions.swift
//  DSKit
//
//  Created by Borinschi Ivan on 5/16/20.
//  Copyright © 2020 Borinschi Ivan. All rights reserved.
//

import Foundation
import UIKit

extension String {
    /// Calculates and returns the height needed to fit the text into a width-constrained rect.
    ///
    /// - Parameters:
    ///   - fixedWidth: The fixed width of the rect.
    ///   - font: The font of the text to calculate for.
    /// - Returns: The height needed to fit the text into a width-constrained rect.
    public func height(forFixedWidth fixedWidth: CGFloat, font: UIFont) -> CGFloat {
        let constraintSize = CGSize(width: fixedWidth, height: .greatestFiniteMagnitude)
        return ceil(rect(for: constraintSize, font: font).height)
    }

    /// Calculates and returns the width needed to fit the text into a height-constrained rect.
    ///
    /// - Parameters:
    ///   - fixedHeight: The fixed height of the rect.
    ///   - font: The font of the text to calculate for.
    /// - Returns: The width needed to fit the text into a height-constrained rect.
    public func width(forFixedHeight fixedHeight: CGFloat, font: UIFont) -> CGFloat {
        let constraintSize = CGSize(width: .greatestFiniteMagnitude, height: fixedHeight)
        return ceil(rect(for: constraintSize, font: font).width)
    }

    private func rect(for constraintSize: CGSize, font: UIFont) -> CGRect {
        let attributes = [NSAttributedString.Key.font: font]
        return (self as NSString).boundingRect(with: constraintSize, options: .usesLineFragmentOrigin, attributes: attributes, context: nil)
    }

    /// - Returns: A hyphenated NSAttributedString with justified alignment and word wrapping line break mode.
    public func hyphenated() -> NSAttributedString {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.hyphenationFactor = 1.0
        paragraphStyle.alignment = .justified
        paragraphStyle.lineBreakMode = .byWordWrapping

        return NSAttributedString(string: self, attributes: [NSAttributedString.Key.paragraphStyle: paragraphStyle])
    }

    /// Superscripts substrings of structure ^{substring} and subscripts substrings of structure _{substring}.
    ///
    /// - Parameters:
    ///   - font: The base font size for the resulting attributed string.
    ///
    /// - Returns: The resulting attributed string with superscripted and subscripted substrings.
    public func superAndSubscripted(font: UIFont) -> NSAttributedString {
        NSAttributedString(string: self).superAndSubscripted(font: font)
    }

    /// Superscripts substrings of structure ^{substring}.
    ///
    /// - Parameters:
    ///   - font: The base font size for the resulting attributed string.
    ///
    /// - Returns: The resulting attributed string with superscripted substrings.
    public func superscripted(font: UIFont) -> NSAttributedString {
        NSAttributedString(string: self).superscripted(font: font)
    }

    /// Subscripts substrings of structure _{substring}.
    ///
    /// - Parameters:
    ///   - font: The base font size for the resulting attributed string.
    ///
    /// - Returns: The resulting attributed string with subscripted substrings.
    public func subscripted(font: UIFont) -> NSAttributedString {
        NSAttributedString(string: self).subscripted(font: font)
    }
}
