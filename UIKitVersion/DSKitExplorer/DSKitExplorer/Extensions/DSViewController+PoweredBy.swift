//
//  DSViewController+PoweredBy.swift
//  DSKit
//
//  Created by Borinschi Ivan on 26.01.2021.
//

import DSKit
import UIKit

extension DSViewController {
 
    func showPoweredBy() {
        
        let powerByText = DSTextComposer(alignment: .center)
        powerByText.add(type: .subheadline, text: "Powered by ", lineSpacing: 5)
        powerByText.add(sfSymbol: "square.stack.3d.down.right.fill", style: .custom(size: 12, weight: .medium), tint: .brand, newLine: false)
        
        powerByText.add(type: .headlineWithSize(13), text: " DSKit", newLine: false)
        powerByText.add(type: .subheadline, text: "Made with ❤️ by imodeveloper")
        
        var poweredByAction = DSActionVM(composer: powerByText)
        poweredByAction.style.displayStyle = .default
        showBottom(content: poweredByAction)
    }
    
    func powerBySection() -> DSSection {
        
        let powerByText = DSTextComposer(alignment: .center)
        powerByText.add(type: .subheadlineWithSize(11), text: "Powered by ", lineSpacing: 5)
        powerByText.add(sfSymbol: "square.stack.3d.down.right.fill", style: .custom(size: 11, weight: .medium), tint: .brand, newLine: false)
        
        powerByText.add(type: .headlineWithSize(11), text: " DSKit", newLine: false)
        powerByText.add(type: .subheadlineWithSize(11), text: "Made with ❤️ by imodeveloper")
        
        var poweredByAction = DSActionVM(composer: powerByText)
        poweredByAction.style.displayStyle = .default
        return  [DSSpaceVM(), poweredByAction, DSSpaceVM()].list()
    }
}
