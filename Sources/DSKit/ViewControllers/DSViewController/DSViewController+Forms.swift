//
//  DSViewController+Forms.swift
//  DSKit
//
//  Created by Borinschi Ivan on 02.02.2021.
//  Copyright © 2021 Borinschi Ivan. All rights reserved.
//

public extension DSViewController {
    func isCurrentFormValid(_ validate: @escaping (Bool) -> Void) {
        collectionView.isCurrentFormValid(validate)
    }
}
