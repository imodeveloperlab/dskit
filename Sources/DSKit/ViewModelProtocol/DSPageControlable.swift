//
//  DSPageControlable.swift
//  DSKit
//
//  Created by Borinschi Ivan on 21.01.2021.
//  Copyright © 2021 Borinschi Ivan. All rights reserved.
//

import Foundation

public protocol DSPageControlable {
    var updatePage: ((Int) -> Void)? {get set}
}
