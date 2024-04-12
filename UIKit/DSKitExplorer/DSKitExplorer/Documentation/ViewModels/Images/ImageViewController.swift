//
//  ImageViewController.swift
//  DSKit
//
//  Created by Borinschi Ivan on 25.01.2021.
//

import UIKit
import DSKit

class ImageViewController: DSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Image"
        
        // Layout
        var list = action(title: "List", description: "Image", icon: "list.bullet")
        list.didTap { [unowned self] (_ :DSActionVM) in
            self.push(ImageListVC())
        }
        
        var grid = action(title: "Grid", description: "Image", icon: "rectangle.grid.2x2.fill")
        grid.didTap { [unowned self] (_ :DSActionVM) in
            self.push(ImageGridVC())
        }
        
        var gallery = action(title: "Gallery", description: "Image", icon: "square.lefthalf.fill")
        gallery.didTap { [unowned self] (_ :DSActionVM) in
            self.push(ImageGalleryVC())
        }
        
        // Images
        var Images = action(title: "Images", description: "Image", icon: "link.circle.fill")
        Images.didTap { [unowned self] (_ :DSActionVM) in
            self.push(ImagesVC())
        }
        
        let layoutSection = [list, grid, gallery].list().subheadlineHeader("Layout")
        let ImagesSection = [Images].list().subheadlineHeader("Images")
        
        let sections: [DSSection] = [layoutSection,
                                     ImagesSection]
        show(content: sections)
        // Demo end
    }
}
