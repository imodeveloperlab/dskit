//
//  DSViewController+SourceCode.swift
//  DSKit
//
//  Created by Borinschi Ivan on 25.01.2021.
//

import Foundation
import DSKit
import UIKit

public extension DSViewController {
    
    func showSourceCodeButton(code: String) {
        
        var button = DSButtonVM(title: "Source Code")
        button.didTap { [unowned self] (_: DSButtonVM) in
            self.push(SourceCodeViewController(code: code))
        }
        
        showBottom(content: button)
    }
    
    func showCode(code: String) {
        
        if !ProcessInfo.processInfo.arguments.contains("UI_TEST_MODE") && (ProcessInfo.processInfo.environment["DOCUMENT"] == nil) {
            
            var codeViewModel = DSCodeVM(code: code)
            
            
            codeViewModel.didTap { [unowned self] (_: DSCodeVM) in
                let activityViewController = UIActivityViewController(activityItems: [code], applicationActivities: nil)
                UIApplication.shared.windows.first?.rootViewController?.present(activityViewController, animated: true, completion: nil)
            }
            
            let text = DSLabelVM(.caption2, text: "Tap on code to open share sheet, to send example code directly to your mac, or copy it.")
            showBottom(content: [text.list(), codeViewModel.gallery()])
            
        } else {
            
            showPoweredBy()
        }
    }
}
