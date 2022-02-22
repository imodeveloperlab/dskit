//
//  DSTextViewUIView.swift
//  DSKit Explorer
//
//  Created by Borinschi Ivan on 18.02.2021.
//  Copyright © 2021 Borinschi Ivan. All rights reserved.
//

import UIKit

final class DSTextViewUIView: UIView, DSReusableUIView, UITextViewDelegate {
    
    @IBOutlet weak var textViewHolder: UITextView!
    @IBOutlet weak var textView: UITextView!
    var viewModel: DSTextViewVM?
    
    /// DSReusableUIView protocol
    public var view: UIView { self }
    
    /// Set up with view model is called each time when a copy of
    /// this uiview is prepared to be displayed on the screen
    /// - Parameter viewModel: DSViewModel
    public func setUpWith(viewModel: DSViewModel) {
        guard let viewModel = viewModel as? DSTextViewVM else { return }
        self.viewModel = viewModel
        update(viewModel: viewModel)
    }
    
    /// Update view with view model
    /// - Parameter viewModel: DSTextViewVM
    func update(viewModel: DSTextViewVM) {
        
        let colors = viewModel.viewColors(mirrored: true)        
        textView.textColor = colors.text.body
        textView.font = DSAppearance.shared.main.fonts.body
        textView.text = viewModel.text
        
        backgroundColor = colors.background
        layer.cornerRadius = colors.cornerRadius
    }
    
    func textViewDidChange(_ textView: UITextView) {
        self.viewModel?.text = textView.text
        
        guard let vm = self.viewModel else {
            return
        }
        
        self.viewModel?.didUpdate?(vm)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    class func instanceFromNib() -> DSTextViewUIView {
        let view: DSTextViewUIView = initFromNib()
        return view
    }
}
