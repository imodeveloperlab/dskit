//
//  DSViewModelDataSource.swift
//  DSKit
//
//  Created by Borinschi Ivan on 02.12.2020.
//  Copyright © 2021 Borinschi Ivan. All rights reserved.
//

import UIKit

/// Used to generate UICollectionViewDiffableDataSource
struct DSViewModelDataSource: Hashable, Equatable {
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(model.hash())
    }
    
    static func == (lhs: DSViewModelDataSource, rhs: DSViewModelDataSource) -> Bool {
        lhs.model.isEqual(to: rhs.model)
    }
    
    let model: DSViewModel
}
