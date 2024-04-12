//
//  DSImageValue.swift
//  DSKit
//
//  Created by Borinschi Ivan on 21.01.2021.
//  Copyright © 2021 Borinschi Ivan. All rights reserved.
//

import UIKit

public enum DSImageContentType {
    case sfSymbol(name: String)
    case image(image: UIImage?)
    case imageURL(url: URL?)
}
