//
//  DSSwitchUIView.swift
//  DSKit Explorer
//
//  Created by Borinschi Ivan on 19.03.2021.
//  Copyright © 2021 Borinschi Ivan. All rights reserved.
//

import UIKit

final class DSSwitchUIView: UIView, DSReusableUIView {
    
    @IBOutlet weak var switchView: UISwitch!
    /// DSReusableUIView protocol
    public var view: UIView { self }
    
    var viewModel: DSSwitchVM?
    
    /// Set up with view model is called each time when a copy of
    /// this uiview is prepared to be displayed on the screen
    /// - Parameter viewModel: DSViewModel
    public func setUpWith(viewModel: DSViewModel) {
        
        guard let viewModel = viewModel as? DSSwitchVM else { return }
        self.viewModel = viewModel
        update(viewModel: viewModel)
    }
    
    /// Update view with view model
    /// - Parameter viewModel: DSSwitchVM
    func update(viewModel: DSSwitchVM) {
        switchView.isOn = viewModel.isOn
        switchView.onTintColor = DSAppearance.shared.main.semanticGreenColor
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = .clear
    }
    
    @IBAction func didUpdate(_ sender: Any) {
        
        guard let viewModel = self.viewModel else {
           return
        }
        
        viewModel.didUpdate?(self.switchView.isOn)
    }
    
    class func instanceFromNib() -> DSSwitchUIView {
        let view: DSSwitchUIView = initFromNib()
        return view
    }
}

