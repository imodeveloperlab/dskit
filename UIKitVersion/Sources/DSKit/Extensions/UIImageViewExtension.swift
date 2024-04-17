//
//  UIImageViewExtension.swift
//  DSKit
//
//  Created by Borinschi Ivan on 09.12.2020.
//  Copyright © 2021 Borinschi Ivan. All rights reserved.
//

import UIKit
import MapKit
import Kingfisher

extension UIImageView {
    
    func setImage(with url: URL?) {
        
        self.backgroundColor = DSAppearance.shared.main.secondaryView.background
        self.tintColor = DSAppearance.shared.main.primaryView.text.subheadline
        let placeholder = UIImage(named: "placeholder", in: Bundle(identifier: "app.dskit.framework"), compatibleWith: nil)
        
        var size = self.bounds.size
        if size.width < 5 || size.height < 5 {            
            let width = UIScreen.main.bounds.width
            size = CGSize(width: width, height: width)
        }
        
        let processor = DownsamplingImageProcessor(size: size)
        
        self.kf.cancelDownloadTask()
        
        self.kf.setImage(with: url,
                         placeholder: placeholder,
                         options: [.processor(processor),
                                   .scaleFactor(UIScreen.main.scale),
                                   .transition(.fade(1)),
                                   .cacheOriginalImage]) { result in
            switch result {
            case .success(_):
                break
            case .failure(_):
                break
            }
        }
    }
    
    func setImage(with image: UIImage?, animated: Bool) {
        
        self.backgroundColor = DSAppearance.shared.main.secondaryView.background
        self.tintColor = DSAppearance.shared.main.primaryView.text.subheadline
        let placeholder = UIImage(named: "placeholder", in: Bundle(identifier: "app.dskit.framework"), compatibleWith: nil)
        self.image = placeholder
        
        guard let image = image else {
            return
        }
        
        if animated {
            
            UIView.transition(with: self,
                              duration: 0.5,
                              options: .transitionCrossDissolve,
                              animations: { self.image = image },
                              completion: nil)
        } else {
            
            self.image = image
            
        }
    }
}

extension UIImageView {
    
    func setMapImage(coordinate: CLLocationCoordinate2D) {
        
        self.backgroundColor = DSAppearance.shared.main.secondaryView.background
        self.tintColor = DSAppearance.shared.main.primaryView.text.subheadline
        
        let additionalInfo = (traitCollection.userInterfaceStyle == .dark ? "dark" : "light")
        let key = "\(coordinate.latitude)\(coordinate.longitude)\(additionalInfo)"
        
        if let imageCache = DSCacheManager.shared.mapImageCache.object(forKey: NSString(string: key)) {
            
            self.setImage(with: imageCache.image, animated: false)
            
        } else {
            
            let annotation = MKPointAnnotation()
            annotation.coordinate = coordinate
            
            let options = MKMapSnapshotter.Options()
            options.pointOfInterestFilter = .none
            options.region = MKCoordinateRegion(center: coordinate, latitudinalMeters: 500, longitudinalMeters: 500)
            options.traitCollection = .init(userInterfaceStyle: DSAppearance.shared.userInterfaceStyle)
            
            let width = UIScreen.main.bounds.size.width            
            options.size = CGSize(width: width, height: width)
            
            let bgQueue = DispatchQueue.global(qos: .background)
            let snapShotter = MKMapSnapshotter(options: options)
            
            snapShotter.start(with: bgQueue, completionHandler: { [weak self] (snapshot, error) in
                
                guard error == nil else {
                    return
                }
                
                DispatchQueue.main.asyncAfter(deadline: .now()) {
                    
                    guard let image = snapshot?.image else {
                        return
                    }
                    
                    let imageCache = DSImageCache()
                    imageCache.image = image
                    
                    DSCacheManager.shared.mapImageCache.setObject(imageCache, forKey: NSString(string: key))
                    self?.setImage(with: image, animated: true)
                }
            })
        }
    }
}
