//
//  DSActionVM+SourceCode.swift
//  DSKit
//
//  Created by Borinschi Ivan on 25.01.2021.
//

import Foundation
import DSKit
import Splash
import UIKit

extension DSActionVM {
    
    static func code(codeString: String, _ style: UIUserInterfaceStyle) -> DSActionVM {
        
        let isLightColor = DSAppearance.shared.main.secondaryView.background.isLight()
        
        let theme: Theme = !(isLightColor ?? false) ? .sunset(withFont: Font(size: 12)) : .midnight(withFont: Font(size: 12))
        let output = AttributedStringOutputFormat(theme: theme)
        let highlighter = SyntaxHighlighter(format: output)
        let code = highlighter.highlight(codeString)
        let codeText = DSTextComposer()
        codeText.add(text: code)
        
        var action = DSActionVM(composer: codeText)
        
        action.rightButton(sfSymbolName: "doc.on.doc.fill", style: .small) {
            print("Copy Text")
        }

        return action
    }    
}
