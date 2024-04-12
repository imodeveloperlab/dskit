//
//  DSViewModel+SideViews.swift
//  DSKit
//
//  Created by Borinschi Ivan on 16.03.2021.
//  Copyright © 2021 Borinschi Ivan. All rights reserved.
//

import UIKit

extension DSViewModel {
    
    mutating func prepareToDisplay() {
        
        if var vm = self.rightSideView?.viewModel {
            vm.style.displayStyle = self.style.displayStyle
            self.rightSideView = DSSideView(view: vm)
        }
        
        if var vm = self.leftSideView?.viewModel {
            vm.style.displayStyle = self.style.displayStyle
            self.leftSideView = DSSideView(view: vm)
        }
        
        if var vm = self.topSideView?.viewModel {
            vm.style.displayStyle = self.style.displayStyle
            self.topSideView = DSSideView(view: vm)
        }
        
        if var vm = self.bottomSideView?.viewModel {
            vm.style.displayStyle = self.style.displayStyle
            self.bottomSideView = DSSideView(view: vm)
        }
    }
}
