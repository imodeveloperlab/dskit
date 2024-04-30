//
//  DSButtonUIView.swift
//  DSKit
//
//  Created by Borinschi Ivan on 11.12.2020.
//  Copyright © 2021 Borinschi Ivan. All rights reserved.
//

import UIKit

final class DSButtonUIView: UIView, DSReusableUIView {
    
    @IBOutlet weak var button: ImoUIButton!
    
    var viewModel: DSButtonVM?
    
    public var view: UIView { self }
    
    public func setUpWith(viewModel: DSViewModel) {
        
        guard let viewModel = viewModel as? DSButtonVM else {
            return
        }
        
        self.viewModel = viewModel
        update(viewModel: viewModel)
    }
    
    /// This method is called each time a copy of DSButtonUIView is prepared to be displayed on screen
    /// - Parameter viewModel: DSButtonVM
    func update(viewModel: DSButtonVM) {
        
        button.setUpWith(viewModel: viewModel)
        
        /// Handle did tap on button
        button.button.didTouchUpInside = { [weak self] _ in
            
            guard let _self = self else {
                return
            }
            
            _self.viewModel?.didTap?(viewModel)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = .clear
        button.backgroundColor = .clear
    }
    
    class func instanceFromNib() -> DSButtonUIView {
        let view: DSButtonUIView = initFromNib()
        return view
    }
}

