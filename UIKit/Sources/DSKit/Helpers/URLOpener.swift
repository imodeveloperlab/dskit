//
//  URLOpener.swift
//  DSKit
//
//  Created by Borinschi Ivan on 9/23/20.
//  Copyright © 2020 Borinschi Ivan. All rights reserved.
//

import Foundation
import UIKit

class URLOpener {
    
    typealias CompletionType = ((Bool) -> Swift.Void)
    typealias OptionsType = [UIApplication.OpenExternalURLOptionsKey: Any]
    
    static func open(_ url: URL, options: OptionsType, completion: CompletionType?) {
        if #available(iOS 10, *) {
            UIApplication.shared.open(url, options: options, completionHandler: completion)
        } else {
            UIApplication.shared.openURL(url)
        }
    }
}
