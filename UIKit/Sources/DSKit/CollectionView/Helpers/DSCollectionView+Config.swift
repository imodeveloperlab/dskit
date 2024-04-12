//
//  DSCollectionView+Config.swift
//  DSKit
//
//  Created by Borinschi Ivan on 02.02.2021.
//  Copyright © 2021 Borinschi Ivan. All rights reserved.
//

import Foundation

extension DSCollectionView {
    
    public var isPagingEnabled: Bool {
        get { view.isPagingEnabled }
        set { view.isPagingEnabled = newValue }
    }
    
    public var showsHorizontalScrollIndicator: Bool {
        get { view.showsHorizontalScrollIndicator }
        set { view.showsHorizontalScrollIndicator = newValue }
    }
    
    public var showsVerticalScrollIndicator: Bool {
        get { view.showsVerticalScrollIndicator }
        set { view.showsVerticalScrollIndicator = newValue }
    }    
}
