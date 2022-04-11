//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  ___COPYRIGHT___
//

import UIKit
import DSKit

final class DS___VARIABLE_moduleName___UIView: UIView, DSReusableUIView {
    
    /// DSReusableUIView protocol
    public var view: UIView { self }
    
    /// Set up with view model is called each time when a copy of
    /// this uiview is prepared to be displayed on the screen
    /// - Parameter viewModel: DSViewModel
    public func setUpWith(viewModel: DSViewModel) {
        
        guard let viewModel = viewModel as? DS___VARIABLE_moduleName___VM else { return }
        update(viewModel: viewModel)
    }
    
    /// Update view with view model
    /// - Parameter viewModel: DS___VARIABLE_moduleName___VM
    func update(viewModel: DS___VARIABLE_moduleName___VM) {
        
        // DO YOUR WORK HERE
        // THIS IS A REUSABLE VIEW
        // THIS METHOD IS CALLED EVERY-TIME THIS VIEW IS DISPLAYED ON SCREEN
    }
    
    class func instanceFromNib() -> DS___VARIABLE_moduleName___UIView {
        let view: DS___VARIABLE_moduleName___UIView = initFromNib()
        return view
    }
}

