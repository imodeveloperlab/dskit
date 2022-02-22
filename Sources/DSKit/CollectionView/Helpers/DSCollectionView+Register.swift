//
//  DSCollectionView+Register.swift
//  DSKit
//
//  Created by Borinschi Ivan on 02.02.2021.
//  Copyright © 2021 Borinschi Ivan. All rights reserved.
//

import UIKit

extension DSCollectionView {
    
    public func registerCellClassIfNeed(for reusableIdentifier: String, cellClass: AnyClass) {
        if !registeredCells.contains(reusableIdentifier) {
            self.view.register(cellClass, forCellWithReuseIdentifier: reusableIdentifier)
            registeredCells.append(reusableIdentifier)
        }
    }
    
    public func registerClassForReusableViewIfNeed(kind: String, reuseIdentifier: String, viewClass: AnyClass) {
        if !registeredViews.contains(reuseIdentifier)  {
            self.view.register(viewClass, forSupplementaryViewOfKind: kind, withReuseIdentifier: reuseIdentifier)
            registeredViews.append(reuseIdentifier)
        }
    }
}
