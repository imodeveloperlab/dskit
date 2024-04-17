//
//  DSReusableUIView.swift
//  DSKit
//
//  Created by Borinschi Ivan on 11.12.2020.
//  Copyright © 2021 Borinschi Ivan. All rights reserved.
//

import UIKit

// Protocol that describes how `DSReusableUIView` should behave
public protocol DSReusableUIView {
    
    /// This method is called each time a view model will display on screen
    /// - Parameter viewModel: DSViewModel
    func setUpWith(viewModel: DSViewModel)
    
    /// This view will be reused each time  a view model will display on screen
    /// and will be updated with data using `setUpWith(viewModel: DSViewModel)` function
    var view: UIView {get}
}
