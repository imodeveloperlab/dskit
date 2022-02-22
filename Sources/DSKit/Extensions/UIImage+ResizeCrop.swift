//
//  UIImage+Resize:Crop.swift
//  DSKit
//
//  Created by Borinschi Ivan on 25.01.2021.
//  Copyright © 2021 Borinschi Ivan. All rights reserved.
//

import UIKit

public extension UIImage {

    func resizeImage(size: CGSize, scale: CGFloat = 1.0) -> UIImage {
        
        let targetSize = size
        let image = self
        let size = image.size
        
        let widthRatio  = targetSize.width  / image.size.width
        let heightRatio = targetSize.height / image.size.height
        
        // Figure out what our orientation is, and use that to form the rectangle
        var newSize: CGSize
        if(widthRatio > heightRatio) {
            newSize = CGSize(width: size.width * heightRatio, height: size.height * heightRatio)
        } else {
            newSize = CGSize(width: size.width * widthRatio, height: size.height * widthRatio)
        }
        
        // This is the rect that we've calculated out and this is what is actually used below
        let rect = CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height)
        
        // Actually do the resizing to the rect using the ImageContext stuff
        UIGraphicsBeginImageContextWithOptions(newSize, false, scale)
        image.draw(in: rect)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return (newImage?.withRenderingMode(self.renderingMode))!
    }
    
    func cropImage(size: CGSize) -> UIImage {
        
        guard let cgimage = self.cgImage else { return self }
        
        let contextImage: UIImage = UIImage(cgImage: cgimage)
        
        var cropWidth: CGFloat = size.width
        var cropHeight: CGFloat = size.height
        
        if (self.size.height < size.height || self.size.width < size.width) {
            return self
        }
        
        let heightPercentage = self.size.height/size.height
        let widthPercentage = self.size.width/size.width
        
        if (heightPercentage < widthPercentage) {
            cropHeight = size.height*heightPercentage
            cropWidth = size.width*heightPercentage
        } else {
            cropHeight = size.height*widthPercentage
            cropWidth = size.width*widthPercentage
        }
        
        let posX: CGFloat = (self.size.width - cropWidth)/2
        let posY: CGFloat = (self.size.height - cropHeight)/2
        
        let rect: CGRect = CGRect(x: posX, y: posY, width: cropWidth, height: cropHeight)
        
        // Create bitmap image from context using the rect
        let imageRef: CGImage = contextImage.cgImage!.cropping(to: rect)!
        
        // Create a new image based on the imageRef and rotate back to the original orientation
        let cropped: UIImage = UIImage(cgImage: imageRef, scale: self.scale, orientation: self.imageOrientation)
        
        return cropped
    }
    
    func cropImage(toRect rect: CGRect) -> UIImage? {
        
        var rect = rect
        rect.origin.y = rect.origin.y * self.scale
        rect.origin.x = rect.origin.x * self.scale
        rect.size.width = rect.width * self.scale
        rect.size.height = rect.height * self.scale
        
        guard let imageRef = self.cgImage?.cropping(to: rect) else {
            return nil
        }
        
        let croppedImage = UIImage(cgImage: imageRef)
        return croppedImage
    }
    
    /// Decode a base64EncodedString to UIImage
    ///
    /// - Parameter base64String: A string in base64.
    /// - Returns: UIImage converted from base64EncodedString.
    class func decodeStringToUIImage(base64String: String) -> UIImage? {
        
        let decodedData = Data(base64Encoded: base64String, options: .init(rawValue: 0))
        
        guard let decodedDATA = decodedData else {
            return nil
        }
        
        let decodedimage = UIImage(data: decodedDATA)
        
        guard let decodedImg = decodedimage else {
            return nil
        }
        
        return decodedImg
    }
}
