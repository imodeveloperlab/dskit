//
//  UIImage+AverageColor.swift
//  DSKit
//
//  Created by Borinschi Ivan on 30.11.2020.
//  Copyright © 2021 Borinschi Ivan. All rights reserved.
//

import UIKit

public extension UIImage {
    
    convenience init?(color: UIColor, size: CGSize = CGSize(width: 1, height: 1)) {
        let rect = CGRect(origin: .zero, size: size)
        UIGraphicsBeginImageContextWithOptions(rect.size, false, 0.0)
        color.setFill()
        UIRectFill(rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        guard let cgImage = image?.cgImage else { return nil }
        self.init(cgImage: cgImage)
    }
}

public extension UIImage {
    
    var averageColor: UIColor? {
        
        var bitmap = [UInt8](repeating: 0, count: 4)
        
        // Get average color.
        let context = CIContext()
        
        guard let cgImage = cgImage else {
            return nil
        }
        
        let inputImage: CIImage = ciImage ?? CoreImage.CIImage(cgImage: cgImage)
        let extent = inputImage.extent
        let inputExtent = CIVector(x: extent.origin.x, y: extent.origin.y, z: extent.size.width, w: extent.size.height)
        
        guard let filter = CIFilter(name: "CIAreaAverage", parameters: [kCIInputImageKey: inputImage, kCIInputExtentKey: inputExtent]) else {
            return nil
        }
        
        guard let outputImage = filter.outputImage else {
            return nil
        }
        
        let outputExtent = outputImage.extent
        assert(outputExtent.size.width == 1 && outputExtent.size.height == 1)
        
        // Render to bitmap.
        context.render(outputImage, toBitmap: &bitmap, rowBytes: 4, bounds: CGRect(x: 0, y: 0, width: 1, height: 1), format: CIFormat.RGBA8, colorSpace: CGColorSpaceCreateDeviceRGB())
        
        // Compute result.
        let result = UIColor(red: CGFloat(bitmap[0]) / 255.0, green: CGFloat(bitmap[1]) / 255.0, blue: CGFloat(bitmap[2]) / 255.0, alpha: CGFloat(bitmap[3]) / 255.0)
        return result
    }
    
    func getColorOfPixel(at pos: CGPoint) -> UIColor {
        
        if let pixelData = self.cgImage?.dataProvider?.data {
            let data: UnsafePointer<UInt8> = CFDataGetBytePtr(pixelData)
            let pixelInfo: Int = ((Int(self.size.width) * Int(pos.y)) + Int(pos.x)) * 4
            let r = CGFloat(data[pixelInfo+0]) / CGFloat(255.0)
            let g = CGFloat(data[pixelInfo+1]) / CGFloat(255.0)
            let b = CGFloat(data[pixelInfo+2]) / CGFloat(255.0)
            let a = CGFloat(data[pixelInfo+3]) / CGFloat(255.0)
            return UIColor(red: b, green: g, blue: r, alpha: a)
            
        } else {
            //IF something is wrong I returned WHITE, but change as needed
            return UIColor.white
        }
    }
}

public extension UIImageView {
    
    func setAverageColorAsBg() {
        
        let que = DispatchQueue(label: "DSKit.que.average.Color")
        let image = self.image
        que.async {
            let color = image?.averageColor
            DispatchQueue.main.async {
                self.backgroundColor = color
            }
        }
    }
}


