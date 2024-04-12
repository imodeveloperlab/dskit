//
//  DSSectionBackgroundColorSecondaryDecorationView.swift
//  DSKit
//
//  Created by Borinschi Ivan on 01.02.2021.
//  Copyright © 2021 Borinschi Ivan. All rights reserved.
//

import UIKit
import Combine

/// Section Background Decoration View
class DSSectionBackgroundColorSecondaryDecorationView: UICollectionReusableView, Subscriber {
    
    typealias Input = DSDesignable
    typealias Failure = Never
    
    public func receive(subscription: Subscription) {
        subscription.request(.unlimited)
    }
    
    public func receive(_ input: Input) -> Subscribers.Demand {
        configure()
        return .none
    }
    
    public func receive(completion: Subscribers.Completion<Never>) {
        print("Received completion: \(completion)")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        DSAppearance.shared.appearancePublisher.subscribe(self)
        configure()
    }
    required init?(coder: NSCoder) {
        fatalError("not implemented")
    }
}

extension DSSectionBackgroundColorSecondaryDecorationView {
    
    func configure() {
        let appearance = DSAppearance.shared.main
        backgroundColor = appearance.secondaryView.background
    }
}
