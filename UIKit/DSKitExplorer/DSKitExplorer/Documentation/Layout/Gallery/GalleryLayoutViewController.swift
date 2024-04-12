//
//  TypographyViewController.swift
//  DSKit
//
//  Created by Borinschi Ivan on 25.01.2021.
//

import UIKit
import DSKit
import DSKitFakery

class GalleryLayoutViewController: DSViewController {
    
    let faker = DSFaker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Gallery"
        
        var absoluteWidth = action(title: "Gallery", description: "Absolute with, height for view models", icon: "square.lefthalf.fill")
        absoluteWidth.didTap { [unowned self] (_ :DSActionVM) in
            self.push(GalleryAbsoluteWidthLayoutVC())
        }
        
        var fractionalWidthLayout = action(title: "Gallery", description: "Fractional width layout", icon: "square.lefthalf.fill")
        fractionalWidthLayout.didTap { [unowned self] (_ :DSActionVM) in
            self.push(GalleryFractionalWidthLayoutVC())
        }
        
        var fractional1LayoutVC = action(title: "Gallery", description: "Fractional width 1.0", icon: "square.lefthalf.fill")
        fractional1LayoutVC.didTap { [unowned self] (_ :DSActionVM) in
            self.push(GalleryFractional1LayoutVC())
        }
        
        var fractional1GroupedLayout = action(title: "Gallery", description: "Fractional width 1.0, grouped", icon: "square.lefthalf.fill")
        fractional1GroupedLayout.didTap { [unowned self] (_ :DSActionVM) in
            self.push(GalleryFractional1GroupedLayoutVC())
        }
        
        var fullWidthLayoutVC = action(title: "Gallery", description: "Full width", icon: "square.lefthalf.fill")
        fullWidthLayoutVC.didTap { [unowned self] (_ :DSActionVM) in
            self.push(GalleryFullWidthLayoutVC())
        }
        
        var pageControlLayoutVC = action(title: "Gallery", description: "Page control", icon: "square.lefthalf.fill")
        pageControlLayoutVC.didTap { [unowned self] (_ :DSActionVM) in
            self.push(GalleryPageControlLayoutVC())
        }
        
        let supplementaryVC = action(title: "Gallery", description: "Supplementary View", icon: "square.lefthalf.fill")
        pageControlLayoutVC.didTap { [unowned self] (_ :DSActionVM) in
            self.push(GalleryWithSupplementaryItemsLayoutVC())
        }
        
        let viewModels: [DSViewModel] = [absoluteWidth,
                                         fullWidthLayoutVC,
                                         fractionalWidthLayout,
                                         fractional1LayoutVC,
                                         fractional1GroupedLayout,
                                         pageControlLayoutVC,
                                         supplementaryVC]
        
        show(content: viewModels.list())
    }
}
