//
//  DSCodeVM.swift
//  DSKit
//
//  Created by Borinschi Ivan on 01.02.2021.
//
//

import UIKit
import DSKit
import Splash
import Cartography

public struct DSCodeVM: DSViewModel, Equatable, Hashable {
    
    var code: String
    var height: DSViewModelHeight = .estimated(50)
    var width: DSViewModelWidth = .fractional(1.0)
    
    // Properties
    public init(code text: String) {
        
        self.code = text
        
        let isLightColor = DSAppearance.shared.main.secondaryView.background.isLight()
        let theme: Theme = (isLightColor ?? false) ? .sunset(withFont: Font(size: 10)) : .midnight(withFont: Font(size: 10))
        let output = AttributedStringOutputFormat(theme: theme)
        let highlighter = SyntaxHighlighter(format: output)
        let attributedText = highlighter.highlight(text)
        
        if let vc = UIApplication.shared.getKeyWindow()?.rootViewController {
            
            let label = UILabel()
            label.attributedText = attributedText
            label.numberOfLines = 0
            
            constrain(label) { label in
                label.width >= 5
                label.height >= 5
            }
            
            vc.view.addSubview(label)
            label.setNeedsLayout()
            label.layoutIfNeeded()
            label.removeFromSuperview()
            
            width = .absolute(label.frame.width + 50)
            height = .estimated(label.frame.height)
        }
    }
    
    public var type: DSCodeVMType = .default
    public var identifier = "Code"
    public var accessibilityIdentifier = "Code"
    
    /// Style
    public var style: DSViewModelStyle = DSViewModelStyle(displayStyle: .grouped(inSection: false))
    
    @NonEquatable public var didTap: ((DSViewModel) -> Void)?
    @NonEquatable public var object: AnyObject?
    public var supplementaryItems: [DSSupplementaryView]?
    
    public var bottomSideView: DSSideView?
    public var leftSideView: DSSideView?
    public var rightSideView: DSSideView?
    public var topSideView: DSSideView?
}

public enum DSCodeVMType {
    case `default`
}

public extension DSCodeVM {
    
    func height(_ layoutEnvironment: NSCollectionLayoutEnvironment?, section: DSSection) -> DSViewModelHeight {
        return height
    }
    
    func width(_ layoutEnvironment: NSCollectionLayoutEnvironment?, section: DSSection) -> DSViewModelWidth {
        return width
    }
    
    func viewRepresentation() -> DSReusableUIView {
        return DSCodeUIView.instanceFromNib()
    }
    
    func isEqual(to model: DSViewModel) -> Bool {
        guard let model = model as? Self else { return false }
        return self == model
    }
    
    func hash() -> String {
        return hashValue.string()
    }
}
