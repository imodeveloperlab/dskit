//
//  DSWalkthroughPageUIView.swift
//  DSKit
//
//  Created by Borinschi Ivan on 27.01.2021.
//
//

import UIKit

final class DSPageUIView: UIView, DSReusableUIView {
    
    @IBOutlet weak var collectionView: DSCollectionView!
    var appearance = DSAppearance.shared.main
    
    public var view: UIView { self }
    
    public func setUpWith(viewModel: DSViewModel) {
        
        guard let viewModel = viewModel as? DSPageVM else { return }
        update(viewModel: viewModel)
    }
    
    func update(viewModel: DSPageVM) {
        
        let section = viewModel.viewModels.list()
        section.insets = viewModel.contentInsets
        collectionView.show(content: [section], animated: false)
        collectionView.backgroundColor = viewModel.viewColors().background
        collectionView.view.backgroundColor = viewModel.viewColors().background
        collectionView.view.backgroundColor = .clear
        collectionView.view.bounces = false
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = .clear
    }
    
    class func instanceFromNib() -> DSPageUIView {
        let view: DSPageUIView = initFromNib()
        return view
    }
}
