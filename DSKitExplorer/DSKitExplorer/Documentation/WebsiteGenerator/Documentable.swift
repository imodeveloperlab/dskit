//
//  Document.swift
//  DSKit
//
//  Created by Borinschi Ivan on 05.02.2021.
//  Copyright © 2021 Borinschi Ivan. All rights reserved.
//

import Foundation
import UIKit

protocol Documentable {
    
    var documentTitle: String {get}
    var documentSubtitle: String {get}
    var documentCode: String {get}
    var documentMarkdownFileName: String? {get}
    var documentViewController: UIViewController? {get}
}
