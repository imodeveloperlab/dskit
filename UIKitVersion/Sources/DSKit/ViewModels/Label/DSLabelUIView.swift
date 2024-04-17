//
//  DSLabelUIView.swift
//  DSKit
//
//  Created by Borinschi Ivan on 15.12.2020.
//  Copyright © 2021 Borinschi Ivan. All rights reserved.
//

import UIKit

final class DSLabelUIView: UIView, DSReusableUIView {
    
    @IBOutlet weak var textLabel: UILabel!
    var appearance = DSAppearance.shared.main
    var fonts = DSAppearance.shared.main.fonts
    
    public var view: UIView { self }
    
    public func setUpWith(viewModel: DSViewModel) {
        
        guard let viewModel = viewModel as? DSLabelVM else {
            return
        }
        
        update(viewModel: viewModel)
    }
    
    func update(viewModel: DSLabelVM) {
        textLabel.set(text: viewModel.textComposer, designableTextColor: viewModel.viewColors().text)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = .clear
    }
    
    class func instanceFromNib() -> DSLabelUIView {
        let view: DSLabelUIView = initFromNib()
        return view
    }
}

