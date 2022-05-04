//
//  DSActiveTextUIView.swift
//  DSKit
//
//  Created by Borinschi Ivan on 15.12.2020.
//  Copyright © 2021 Borinschi Ivan. All rights reserved.
//

import UIKit
import ActiveLabel
import Cartography

final class DSActiveTextUIView: UIView, DSReusableUIView {
    
    var textView: ActiveLabel?
    var appearance = DSAppearance.shared.main
    public var view: UIView { self }
    
    public func setUpWith(viewModel: DSViewModel) {
        
        setUp()
        guard let viewModel = viewModel as? DSActiveTextVM else { return }
        update(viewModel: viewModel)
    }
    
    func setUp() {
        
        if textView == nil {
            
            textView = ActiveLabel(frame: .zero)
            
            guard let textView = textView else {
                return
            }
            
            self.addSubview(textView)
            
            constrain(self, textView) { view, textView in
                textView.edges == view.edges
            }
        }
    }
    
    func update(viewModel: DSActiveTextVM) {
        
        guard let textView = textView else {
            return
        }
        
        textView.numberOfLines = 0
        textView.text = viewModel.text
        textView.textColor = viewModel.textType.style.color.getColor(designableTextColor: viewModel.viewColors().text)
        textView.textAlignment = viewModel.alignment
        textView.font = viewModel.textType.style.font.getFont()
        
        let color = appearance.primaryView.button.background
        let selectedColor = appearance.primaryView.button.background.lighten(.C100)
        
        textView.mentionColor = color
        textView.mentionSelectedColor = selectedColor
        
        textView.hashtagColor = color
        textView.hashtagSelectedColor = selectedColor
        
        let email = ActiveType.custom(pattern: patternEmail)
        let phone = ActiveType.custom(pattern: patternPhoneNumber2)
        
        textView.customColor = [email: color, phone: color]
        textView.enabledTypes = [.mention, .hashtag, .url, email, phone]
        
        textView.handleURLTap { url in
            viewModel.didTapOnUrl?(url)
        }
        
        textView.handleMentionTap { mention in
            viewModel.didTapOnMention?(mention)
        }
        
        textView.handleHashtagTap { tag in
            viewModel.didTapOnHashTag?(tag)
        }
        
        textView.handleCustomTap(for: email) { email in
            viewModel.didTapOnEmail?(email)
        }
        
        textView.handleCustomTap(for: phone) { phone in
            viewModel.didTapOnPhone?(phone)
        }
        
        textView.hightlightFont = viewModel.linksFont?.getFont()
        
        addLinksToText(viewModel: viewModel)
    }
    
    private func addLinksToText(viewModel: DSActiveTextVM) {
        
        guard let textView = textView else {
            return
        }
        
        for (keyString, url) in viewModel.links {
            
            textView.customize { (label: ActiveLabel) in
                
                let string = ActiveType.custom(pattern: "\\s\(keyString)\\b")
                textView.enabledTypes.append(string)
                
                textView.customColor[string] = appearance.primaryView.button.background
                textView.customSelectedColor[string] = appearance.primaryView.button.background.lighten(.C100)
                
                textView.handleCustomTap(for: string, handler: { _ in
                    
                    guard let url = URL(string: url) else {
                        return
                    }
                    
                    viewModel.didTapOnUrl?(url)
                })
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = .clear
    }
    
    class func instanceFromNib() -> DSActiveTextUIView {
        let view: DSActiveTextUIView = initFromNib()
        return view
    }
}

