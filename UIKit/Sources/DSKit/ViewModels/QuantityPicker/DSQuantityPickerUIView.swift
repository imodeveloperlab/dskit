//
//  DSQuantityPickerUIView.swift
//  DSKit Explorer
//
//  Created by Borinschi Ivan on 15.03.2021.
//  Copyright © 2021 Borinschi Ivan. All rights reserved.
//

import UIKit

final class DSQuantityPickerUIView: UIView, DSReusableUIView {
    
    // Text
    @IBOutlet weak var pickerView: UIView!
    
    // Left / Right views
    @IBOutlet weak var leftView: UIView?
    @IBOutlet weak var rightView: UIView?
    
    // Spaces
    @IBOutlet weak var leftPickerSpace: NSLayoutConstraint!
    @IBOutlet weak var rightPickerSpace: NSLayoutConstraint!
    
    // Appearance
    var appearance = DSAppearance.shared.main
    
    @IBOutlet weak var decreaseQuantityButton: ImoUIButton!
    @IBOutlet weak var increaseQuantityButton: ImoUIButton!
    
    @IBOutlet weak var quantityLabel: UILabel!
    
    var viewModel: DSQuantityPickerVM?
    
    var addButton: DSButtonVM!
    var removeButton: DSButtonVM!
    
    /// DSReusableUIView protocol
    public var view: UIView { self }
    
    /// Set up with view model is called each time when a copy of
    /// this uiview is prepared to be displayed on the screen
    /// - Parameter viewModel: DSViewModel
    public func setUpWith(viewModel: DSViewModel) {
        
        guard let viewModel = viewModel as? DSQuantityPickerVM else { return }
        self.viewModel = viewModel
        
        update(viewModel: viewModel)
        updateLayout(viewModel: viewModel)
        setUpButtonsStyle()
    }
    
    /// Update layout with view model
    /// - Parameter viewModel: DSActionVM
    func updateLayout(viewModel: DSQuantityPickerVM) {
        
        // Set left view and right view
        rightView?.set(view: viewModel.rightView, designableViewColors: viewModel.viewColors())
        leftView?.set(view: viewModel.leftView, designableViewColors: viewModel.viewColors())
        
        // Update spaces
        leftPickerSpace.constant = (viewModel.leftView == nil) ? 0 : appearance.groupMargins
        rightPickerSpace.constant = (viewModel.rightView == nil) ? 0 : appearance.groupMargins
    }
    
    /// Update view with view model
    /// - Parameter viewModel: DSQuantityPickerVM
    func update(viewModel: DSQuantityPickerVM) {        
        quantityLabel.text = viewModel.quantity.string()
        updateQuantityLabel(viewModel: viewModel)
        quantityLabel.setStyle(type: viewModel.quantityTextType, designableTextColor: viewModel.viewColors().text)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = .clear
        setUpButtonsStyle()
    }
    
    func setUpButtonsStyle() {
        
        addButton = DSButtonVM(sfSymbol: "plus")
        removeButton = DSButtonVM(sfSymbol: "minus")
        
        addButton.style.colorStyle = self.viewModel?.style.colorStyle ?? .default
        addButton.style.displayStyle = self.viewModel?.style.displayStyle ?? .default
        decreaseQuantityButton.setUp()
        
        removeButton.style.colorStyle = self.viewModel?.style.colorStyle ?? .default
        removeButton.style.displayStyle = self.viewModel?.style.displayStyle ?? .default
        decreaseQuantityButton.setUp()
        
        increaseQuantityButton.viewModel = addButton
        decreaseQuantityButton.viewModel = removeButton
        
        increaseQuantityButton.button.didTouchUpInside = { _ in
            
            guard let viewModel = self.viewModel else {
                return
            }
            
            viewModel.quantity = viewModel.quantity + 1
            self.updateQuantityLabel(viewModel: viewModel)
            viewModel.quantityDidUpdate?(viewModel.quantity)
            viewModel.quantityDidIncrease?(viewModel.quantity)
        }
        
        decreaseQuantityButton.button.didTouchUpInside = { _ in
            
            guard let viewModel = self.viewModel else {
                return
            }
            
            guard viewModel.quantity >= 1 else {
                return
            }
            
            viewModel.quantity -= 1
            self.updateQuantityLabel(viewModel: viewModel)
            viewModel.quantityDidUpdate?(viewModel.quantity)
            viewModel.quantityDidIncrease?(viewModel.quantity)
        }
    }
    
    func updateQuantityLabel(viewModel: DSQuantityPickerVM) {
        
        var sufix = ""
        
        if let plural = viewModel.quantityPluralText,
           let singular = viewModel.quantitySingularText {
            
            sufix = " \(viewModel.quantity.getCorrectForm(singular: singular, plural: plural))"
        }
        
        self.quantityLabel.text = viewModel.quantity.string() + sufix
    }
    
    class func instanceFromNib() -> DSQuantityPickerUIView {
        let view: DSQuantityPickerUIView = initFromNib()
        return view
    }
}
