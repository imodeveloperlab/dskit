//
//  DSSection+Count.swift
//  DSKit
//
//  Created by Borinschi Ivan on 04.02.2021.
//  Copyright © 2021 Borinschi Ivan. All rights reserved.
//

import Foundation

public extension Array where Element == DSSection {
    
    var totalViewModelsCount: Int {
        return reduce(into: 0) { (count, section) in
            count += section.viewModels.count
        }
    }
    
    var totalTextFieldViewModelsCount: Int {
        return reduce(into: 0) { (count, section) in
            count += section.viewModels.reduce(into: 0, { (textFieldsCount, viewModel) in
                if viewModel is DSTextFieldVM {
                    textFieldsCount += 1
                }
            })
        }
    }
}



