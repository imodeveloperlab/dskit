//
//  SegmentViewController.swift
//  DSKit
//
//  Created by Borinschi Ivan on 25.01.2021.
//

import UIKit
import DSKit

class PageControlViewController: DSViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = documentTitle
        showCode(code: documentCode)
        showDemo()
    }
    
    func showDemo() {
        
        // Demo begin
        
        // Numbers
        let numbers = [1, 2, 3, 4]
        
        // Map numbers into an array of view models
        let viewModels = numbers.map { (index) -> DSViewModel in
            
            var viewModel = DSImageVM(image: UIImage(named: "picture-\(index)"))
            viewModel.height = .absolute(200)
            return viewModel
        }
        
        // Page controll
        let pageControl = DSPageControlVM(type: .viewModels(viewModels))
        
        // Sections
        let section = pageControl.list().zeroLeftRightInset()
        let section2 = pageControl.list().zeroLeftRightInset()
        
        // Show
        show(content: section, section2)
        
        // Demo end
    }
}

extension PageControlViewController: Documentable {
    
    var documentViewController: UIViewController? {
        return self.viewController
    }
    
    
    var documentTitle: String {
        "Page Control"
    }
    
    var documentSubtitle: String {
        "Page control example"
    }
    
    var documentCode: String {
        """
        // Numbers
        let numbers = [1, 2, 3, 4]
        
        // Map numbers into an array of view models
        let viewModels = numbers.map { (index) -> DSViewModel in
            
            var viewModel = DSBoxVM(text: index.string())
            viewModel.height = .absolute(200)
            return viewModel
        }
        
        // Page controll
        var pageControl = DSPageControlVM(type: .viewModels(viewModels))
        
        // Sections
        let section = pageControl.list().zeroLeftRightInset()
        let section2 = pageControl.list().zeroLeftRightInset()
        
        // Show
        show(content: section, section2)
        """
    }
    
    var documentMarkdownFileName: String? {
        return nil
    }
}

// MARK: - SwiftUI Preview

import SwiftUI

struct PageControlViewControllerPreview: PreviewProvider {
    
    static var previews: some View {
        Group {
            PreviewContainer(VC: PageControlViewController(), DSKitAppearance()).edgesIgnoringSafeArea(.all)
        }
    }
}
