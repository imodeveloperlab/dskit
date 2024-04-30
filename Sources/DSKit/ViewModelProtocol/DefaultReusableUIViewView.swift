//
//  DefaultReusableUIViewView.swift
//  DSKit
//
//  Created by Borinschi Ivan on 02.02.2021.
//  Copyright © 2021 Borinschi Ivan. All rights reserved.
//

import UIKit

public class DefaultReusableUIViewView: UIView, DSReusableUIView {
    
    public var view: UIView {
        self
    }
    
    public func setUpWith(viewModel: DSViewModel) {
        print("Please implement getUIViewRepresentation() protocol method for \(viewModel)")
    }
}
