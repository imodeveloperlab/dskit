//
//  DSSeparatorUIView.swift
//  DSKit
//
//  Created by Borinschi Ivan on 18.12.2020.
//  Copyright © 2021 Borinschi Ivan. All rights reserved.
//

import UIKit

final class DSSeparatorUIView: UIView, DSReusableUIView {
        
    @IBOutlet weak var separatorView: UIView!
    @IBOutlet weak var leftSpace: NSLayoutConstraint!
    @IBOutlet weak var rightSpace: NSLayoutConstraint!
    public var view: UIView { self }
    
    let appearance = DSAppearance.shared.main
    
    public func setUpWith(viewModel: DSViewModel) {
        guard let viewModel = viewModel as? DSSeparatorVM else { return }
        update(viewModel: viewModel)
    }
    
    func update(viewModel: DSSeparatorVM) {
        
        backgroundColor = .clear
        separatorView.backgroundColor = viewModel.viewColors().separator
        leftSpace.constant = 0
        rightSpace.constant = 0
    }
    
    class func instanceFromNib() -> DSSeparatorUIView {
        let view: DSSeparatorUIView = initFromNib()
        return view
    }
}
