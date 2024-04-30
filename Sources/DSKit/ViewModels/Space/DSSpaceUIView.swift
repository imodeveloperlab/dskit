//
//  DSSpaceUIView.swift
//  DSKit
//
//  Created by Borinschi Ivan on 18.12.2020.
//  Copyright © 2021 Borinschi Ivan. All rights reserved.
//

import UIKit

final class DSSpaceUIView: UIView, DSReusableUIView {
    
    public var view: UIView { self }
    @IBOutlet weak var spaceView: UIView!
    
    public func setUpWith(viewModel: DSViewModel) {
        guard let viewModel = viewModel as? DSSpaceVM else { return }
        update(viewModel: viewModel)
    }
    
    func update(viewModel: DSSpaceVM) {
        spaceView.backgroundColor = .clear
    }
    
    class func instanceFromNib() -> DSSpaceUIView {
        let view: DSSpaceUIView = initFromNib()
        return view
    }
}
