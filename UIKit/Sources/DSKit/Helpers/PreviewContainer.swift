//
//  PreviewContainer.swift
//  DSKit+FlowerStore
//
//  Created by Borinschi Ivan on 23.02.2021.
//  Copyright © 2021 Borinschi Ivan. All rights reserved.
//

import UIKit
import SwiftUI

public struct PreviewContainer: UIViewControllerRepresentable {
    
    let viewController: UIViewController
    let appearance: DSDesignable?
    let navigationController: Bool
    
    public init(VC: UIViewController, _ appearance: DSDesignable? = nil, _ navigationController: Bool = false) {
        self.viewController = VC
        self.appearance = appearance
        self.navigationController = navigationController
    }
    
    public func makeUIViewController(context: UIViewControllerRepresentableContext<PreviewContainer>) -> UIViewController {
        
        if let appearance = self.appearance {
            DSAppearance.shared.main = appearance
        }
        
        if navigationController {
            return DSNavigationViewController(rootViewController: viewController)
        } else {
            return viewController
        }
    }
    
    public func updateUIViewController(_ uiViewController: UIViewController, context: UIViewControllerRepresentableContext<PreviewContainer>) {
    }
    
    public typealias UIViewControllerType = UIViewController
}
