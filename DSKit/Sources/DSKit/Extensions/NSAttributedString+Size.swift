// Copyright © 2017 Flinesoft. All rights reserved.

import UIKit

private let scriptedTextSizeRatio: CGFloat = 0.618

extension NSAttributedString {
    /// Calculates and returns the height needed to fit the text into a width-constrained rect.
    ///
    /// - Parameters:
    ///   - fixedWidth: The fixed width of the rect.
    ///   - font: The font of the text to calculate for.
    /// - Returns: The height needed to fit the text into a width-constrained rect.
    public func height(forFixedWidth fixedWidth: CGFloat, font: UIFont) -> CGFloat {
        let constraintSize = CGSize(width: fixedWidth, height: .greatestFiniteMagnitude)
        return rect(for: constraintSize, font: font).height
    }

    /// Calculates and returns the width needed to fit the text into a height-constrained rect.
    ///
    /// - Parameters:
    ///   - fixedHeight: The fixed height of the rect.
    ///   - font: The font of the text to calculate for.
    /// - Returns: The width needed to fit the text into a height-constrained rect.
    public func width(forFixedHeight fixedHeight: CGFloat, font: UIFont) -> CGFloat {
        let constraintSize = CGSize(width: .greatestFiniteMagnitude, height: fixedHeight)
        return rect(for: constraintSize, font: font).width
    }

    private func rect(for constraintSize: CGSize, font: UIFont) -> CGRect {
        let copy = mutableCopy() as! NSMutableAttributedString
        copy.addAttribute(NSAttributedString.Key.font, value: font, range: NSRange(location: 0, length: length))
        return copy.boundingRect(with: constraintSize, options: .usesLineFragmentOrigin, context: nil)
    }

    /// Superscripts substrings of structure ^{substring} and subscripts substrings of structure _{substring}.
    ///
    /// - Parameters:
    ///   - font: The base font size for the resulting attributed string.
    ///   - applyFont: Specify if the font shall be applied to the resulting attributed string. Defaults to `true`.
    ///
    /// - Returns: The resulting attributed string with superscripted and subscripted substrings.
    public func superAndSubscripted(font: UIFont, applyFont: Bool = true) -> NSAttributedString {
        subscripted(font: font).superscripted(font: font, applyFont: false)
    }

    /// Superscripts substrings of structure ^{substring}.
    ///
    /// - Parameters:
    ///   - font: The base font size for the resulting attributed string.
    ///   - applyFont: Specify if the font shall be applied to the resulting attributed string. Defaults to `true`.
    ///
    /// - Returns: The resulting attributed string with superscripted substrings.
    public func superscripted(font: UIFont, applyFont: Bool = true) -> NSAttributedString {
        scripted(
            font: font,
            regex: try! NSRegularExpression(pattern: "\\^\\{([^\\}]*)\\}"), // swiftlint:disable:this force_try
            captureBaselineOffset: font.pointSize * (1.0 - scriptedTextSizeRatio),
            applyFont: applyFont
        )
    }

    /// Subscripts substrings of structure _{substring}.
    ///
    /// - Parameters:
    ///   - font: The base font size for the resulting attributed string.
    ///   - applyFont: Specify if the font shall be applied to the resulting attributed string. Defaults to `true`.
    ///
    /// - Returns: The resulting attributed string with subscripted substrings.
    public func subscripted(font: UIFont, applyFont: Bool = true) -> NSAttributedString {
        scripted(
            font: font,
            regex: try! NSRegularExpression(pattern: "\\_\\{([^\\}]*)\\}"), // swiftlint:disable:this force_try
            captureBaselineOffset: font.pointSize * -(scriptedTextSizeRatio / 5),
            applyFont: applyFont
        )
    }

    private func scripted(font: UIFont, regex: NSRegularExpression, captureBaselineOffset: CGFloat, applyFont: Bool = true) -> NSAttributedString {
        // apply font to entire string
        let unprocessedString = self.mutableCopy() as! NSMutableAttributedString

        if applyFont {
            unprocessedString.addAttribute(.font, value: font, range: NSRange(location: 0, length: unprocessedString.length))
        }

        // start reading in the string part by part
        let attributedString = NSMutableAttributedString()

        while let match = regex.firstMatch(
            in: unprocessedString.string,
            options: .reportCompletion,
            range: NSRange(location: 0, length: unprocessedString.length)
        ) {
            // add substring before match
            let substringBeforeMatch = unprocessedString.attributedSubstring(from: NSRange(location: 0, length: match.range.location))
            attributedString.append(substringBeforeMatch)

            // add match with subscripted style
            let capturedSubstring = unprocessedString.attributedSubstring(from: match.range(at: 1)).mutableCopy() as! NSMutableAttributedString
            let captureFullRange = NSRange(location: 0, length: capturedSubstring.length)
            capturedSubstring.addAttribute(.font, value: font.withSize(font.pointSize * scriptedTextSizeRatio), range: captureFullRange)
            capturedSubstring.addAttribute(.baselineOffset, value: captureBaselineOffset, range: captureFullRange)
            attributedString.append(capturedSubstring)

            // strip off the processed part
            unprocessedString.deleteCharacters(in: NSRange(location: 0, length: match.range.location + match.range.length))
        }

        // add substring after last match
        attributedString.append(unprocessedString)

        return attributedString.copy() as! NSAttributedString
    }
}
