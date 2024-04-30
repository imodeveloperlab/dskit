// Copyright © 2020 Flinesoft. All rights reserved.

import UIKit

extension UIColor {
    
    /// A list of changeable attributes of the UIColor.
    ///
    /// - Red:
    /// - Green:
    /// - Blue:
    /// - Alpha:
    /// - Hue:
    /// - Saturation:
    /// - Brightness:
    ///
    public enum ChangeableAttribute {
        /// The red color part of RGB.
        case red
        /// The green color part of RGB.
        case green
        /// The blue color part of RGB.
        case blue
        /// The hue color part of HSB.
        case hueHSB
        /// The saturation color part of HSB.
        case saturation
        /// The brightness color part of HSB.
        case brightness
        /// The hue color part of HLC.
        case hueHLC
        /// The luminance color part of HLC.
        case luminance
        /// The chroma color part of HLC.
        case chroma
        /// The alpha color part of RGB / HSB / HLC.
        case alpha
    }
    
    // MARK: - Computed Properties
    /// The HLC & alpha attributes of the `UIColor` instance.
    public var hlca: (hue: CGFloat, luminance: CGFloat, chroma: CGFloat, alpha: CGFloat) { // swiftlint:disable:this large_tuple
        let lch = rgbColor().toLCH()
        return (hue: lch.h / 360, luminance: lch.l / 100, chroma: lch.c / 128, alpha: lch.alpha)
    }
    
    /// The HSB & alpha attributes of the `UIColor` instance.
    public var hsba: (hue: CGFloat, saturation: CGFloat, brightness: CGFloat, alpha: CGFloat) { // swiftlint:disable:this large_tuple
        var hue: CGFloat = 0, saturation: CGFloat = 0, brightness: CGFloat = 0, alpha: CGFloat = 0
        getHue(&hue, saturation: &saturation, brightness: &brightness, alpha: &alpha)
        
        return (hue: hue, saturation: saturation, brightness: brightness, alpha: alpha)
    }
    
    /// The RGB & alpha attributes of the `UIColor` instance.
    public var rgba: (red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) { // swiftlint:disable:this large_tuple
        var red: CGFloat = 0, green: CGFloat = 0, blue: CGFloat = 0, alpha: CGFloat = 0
        getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        
        return (red: red, green: green, blue: blue, alpha: alpha)
    }
    
    /// Initializes and returns a color with the given HLCA values.
    ///
    /// - Parameters:
    ///   - hue:        The hue. A value between 0 and 1.
    ///   - luminance:  The luminance. A value between 0 and 1.
    ///   - chroma:     The chroma. A value between 0 and 1.
    ///   - alpha:      The alpha. A value between 0 and 1.
    public convenience init(hue: CGFloat, luminance: CGFloat, chroma: CGFloat, alpha: CGFloat) {
        let rgb = LCHColor(l: luminance * 100, c: chroma * 128, h: hue * 360, alpha: alpha).toRGB()
        self.init(red: rgb.r, green: rgb.g, blue: rgb.b, alpha: rgb.alpha)
    }
    
    // MARK: - Methods
    /// Creates a new `UIColor` object with a single attribute changed by a given difference using addition.
    ///
    /// - Parameters:
    ///   - attribute: The attribute to change.
    ///   - by: The addition to be added to the current value of the attribute.
    /// - Returns: The resulting new `UIColor` with the specified change applied.
    public func change(_ attribute: ChangeableAttribute, by addition: CGFloat) -> UIColor {
        switch attribute {
        case .red:
            return change(attribute, to: rgba.red + addition)
            
        case .green:
            return change(attribute, to: rgba.green + addition)
            
        case .blue:
            return change(attribute, to: rgba.blue + addition)
            
        case .hueHSB:
            return change(attribute, to: hsba.hue + addition)
            
        case .saturation:
            return change(attribute, to: hsba.saturation + addition)
            
        case .brightness:
            return change(attribute, to: hsba.brightness + addition)
            
        case .hueHLC:
            return change(attribute, to: hlca.hue + addition)
            
        case .luminance:
            return change(attribute, to: hlca.luminance + addition)
            
        case .chroma:
            return change(attribute, to: hlca.chroma + addition)
            
        case .alpha:
            return change(attribute, to: hlca.alpha + addition)
        }
    }
    
    /// Creates a new `UIColor` object with the value of a single attribute set to a given value.
    ///
    /// - Parameters:
    ///   - attribute: The attribute to change.
    ///   - to: The new value to be set for the attribute.
    /// - Returns: The resulting new `UIColor` with the specified change applied.
    public func change(_ attribute: ChangeableAttribute, to newValue: CGFloat) -> UIColor {
        switch attribute {
        case .red, .green, .blue:
            return newRgbaColor(attribute, newValue)
            
        case .hueHSB, .saturation, .brightness:
            return newHsbaColor(attribute, newValue)
            
        case .hueHLC, .luminance, .chroma, .alpha:
            return newHlcaColor(attribute, newValue)
        }
    }
    
    private func newHlcaColor(_ attribute: UIColor.ChangeableAttribute, _ newValue: CGFloat) -> UIColor {
        var newHlca = hlca
        
        switch attribute {
        case .hueHLC:
            newHlca.hue = newValue
            
        case .luminance:
            newHlca.luminance = newValue
            
        case .chroma:
            newHlca.chroma = newValue
            
        case .alpha:
            newHlca.alpha = newValue
            
        default:
            break
        }
        
        return UIColor(hue: newHlca.hue, luminance: newHlca.luminance, chroma: newHlca.chroma, alpha: newHlca.alpha)
    }
    
    private func newHsbaColor(_ attribute: UIColor.ChangeableAttribute, _ newValue: CGFloat) -> UIColor {
        var newHsba = hsba
        
        switch attribute {
        case .hueHSB:
            newHsba.hue = newValue
            
        case .saturation:
            newHsba.saturation = newValue
            
        case .brightness:
            newHsba.brightness = newValue
            
        default:
            break
        }
        
        return UIColor(hue: newHsba.hue, saturation: newHsba.saturation, brightness: newHsba.brightness, alpha: newHsba.alpha)
    }
    
    private func newRgbaColor(_ attribute: UIColor.ChangeableAttribute, _ newValue: CGFloat) -> UIColor {
        var newRgba = rgba
        
        switch attribute {
        case .red:
            newRgba.red = newValue
            
        case .green:
            newRgba.green = newValue
            
        case .blue:
            newRgba.blue = newValue
            
        default:
            break
        }
        
        return UIColor(red: newRgba.red, green: newRgba.green, blue: newRgba.blue, alpha: newRgba.alpha)
    }
}

public extension UIColor {
    
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    convenience init(_ netHex: Int) {
        self.init(red: (netHex >> 16) & 0xff, green: (netHex >> 8) & 0xff, blue: netHex & 0xff)
    }
}

public extension UIColor {
    
    /// Mix two colors and return mixed color.
    ///
    /// - Parameters:
    ///   - mainColor: First color.
    ///   - overlayColor: Second color.
    ///   - opacity: Opacity of color.
    /// - Returns: Return UIColor from mixed two colors.
    class func colorOverlay(mainColor: UIColor, overlayColor: UIColor, opacity: CGFloat) -> UIColor? {
        let mainView = UIView()
        mainView.backgroundColor = mainColor
        mainView.frame = CGRect(x: 0, y: 0, width: 2, height: 2)

        let overlayView = UIView()
        overlayView.alpha = opacity
        overlayView.backgroundColor = overlayColor
        overlayView.frame = CGRect(x: 0, y: 0, width: 2, height: 2)
        mainView.addSubview(overlayView)
        
        guard let image = mainView.snapshotImage() else {
            return nil
        }
        return image.getColorOfPixel(at: CGPoint(x: 1, y: 1))
    }
}

public extension UIColor {
    
    var rgbComponents:(red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) {
        var r: CGFloat = 0
        var g: CGFloat = 0
        var b: CGFloat = 0
        var a: CGFloat = 0
        if getRed(&r, green: &g, blue: &b, alpha: &a) {
            return (r, g, b, a)
        }
        return (0, 0, 0, 0)
    }
    
    // hue, saturation, brightness and alpha components from UIColor**
    var hsbComponents:(hue: CGFloat, saturation: CGFloat, brightness: CGFloat, alpha: CGFloat) {
        var hue: CGFloat = 0
        var saturation: CGFloat = 0
        var brightness: CGFloat = 0
        var alpha: CGFloat = 0
        if getHue(&hue, saturation: &saturation, brightness: &brightness, alpha: &alpha) {
            return (hue, saturation, brightness, alpha)
        }
        return (0, 0, 0, 0)
    }
    
    var htmlRGBColor: String {
        return String(format: "#%02x%02x%02x", Int(rgbComponents.red * 255), Int(rgbComponents.green * 255), Int(rgbComponents.blue * 255))
    }
    
    var hexRGBColor: String {
        return String(format: "%02x%02x%02x", Int(rgbComponents.red * 255), Int(rgbComponents.green * 255), Int(rgbComponents.blue * 255))
    }
    
    var htmlRGBaColor: String {
        return String(format: "#%02x%02x%02x%02x", Int(rgbComponents.red * 255), Int(rgbComponents.green * 255), Int(rgbComponents.blue * 255), Int(rgbComponents.alpha * 255) )
    }
    
    var htmlHSBColor: String {
        return String(format: "#%02x%02x%02x", Int(hsbComponents.hue * 255), Int(hsbComponents.saturation * 255), Int(hsbComponents.brightness * 255))
    }
    
    var htmlHSBaColor: String {
        return String(format: "#%02x%02x%02x%02x", Int(hsbComponents.hue * 255), Int(hsbComponents.saturation * 255), Int(hsbComponents.brightness * 255), Int(hsbComponents.alpha * 255) )
    }
}
