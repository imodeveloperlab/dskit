//
//  DSCodeUIView.swift
//  DSKit
//
//  Created by Borinschi Ivan on 01.02.2021.
//
//

import UIKit
import DSKit
import Splash

final class DSCodeUIView: UIView, DSReusableUIView {
    
    @IBOutlet weak var label: UILabel!
    var appearance = DSAppearance.shared.main
    
    public var view: UIView { self }
    
    public func setUpWith(viewModel: DSViewModel) {
        guard let viewModel = viewModel as? DSCodeVM else { return }
        update(viewModel: viewModel)
    }
    
    func update(viewModel: DSCodeVM) {
        let isLightColor = DSAppearance.shared.main.secondaryView.background.isLight()
        let theme: Theme = (isLightColor ?? false) ? .sunset(withFont: Font(size: 10)) : .midnight(withFont: Font(size: 10))
        let output = AttributedStringOutputFormat(theme: theme)
        
        let highlighter = SyntaxHighlighter(format: output)
        let attributedText = highlighter.highlight(viewModel.code)
        
        label.attributedText = attributedText
        label.textAlignment = .left
        label.numberOfLines = 0
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = .clear
    }
    
    class func instanceFromNib() -> DSCodeUIView {
        let view: DSCodeUIView = initFromNib()
        return view
    }
}

