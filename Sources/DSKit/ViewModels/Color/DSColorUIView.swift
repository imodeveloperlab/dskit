//
//  DSColorUIView.swift
//  DSKit Explorer
//
//  Created by Borinschi Ivan on 18.03.2021.
//  Copyright © 2021 Borinschi Ivan. All rights reserved.
//

import UIKit

final class DSColorUIView: UIView, DSReusableUIView {
    
    @IBOutlet weak var colorView: UIView!
    
    /// DSReusableUIView protocol
    public var view: UIView { self }
    
    /// Set up with view model is called each time when a copy of
    /// this uiview is prepared to be displayed on the screen
    /// - Parameter viewModel: DSViewModel
    public func setUpWith(viewModel: DSViewModel) {
        
        guard let viewModel = viewModel as? DSColorVM else { return }
        update(viewModel: viewModel)
    }
    
    /// Update view with view model
    /// - Parameter viewModel: DSColorVM
    func update(viewModel: DSColorVM) {
        colorView.backgroundColor = viewModel.color
        colorView.layer.cornerRadius = viewModel.viewColors().cornerRadius
        colorView.clipsToBounds = true
        colorView.layer.borderWidth = 1.5
        colorView.layer.borderColor = DSAppearance.shared.main.secondaryView.background.cgColor
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = .clear
    }
    
    class func instanceFromNib() -> DSColorUIView {
        let view: DSColorUIView = initFromNib()
        return view
    }
}

