//
//  DSSegmentUIView.swift
//  DSKit
//
//  Created by Borinschi Ivan on 17.12.2020.
//  Copyright © 2021 Borinschi Ivan. All rights reserved.
//
//

import UIKit

final class DSSegmentUIView: UIView, DSReusableUIView {
    
    @IBOutlet weak var segmentControl: UISegmentedControl!
    var appearance = DSAppearance.shared.main
    
    var viewModel: DSSegmentVM?
    
    public var view: UIView { self }
    
    public func setUpWith(viewModel: DSViewModel) {
        
        guard let viewModel = viewModel as? DSSegmentVM else { return }
        self.viewModel = viewModel
        update(viewModel: viewModel)
    }
    
    func update(viewModel: DSSegmentVM) {
    
        for (index, segment) in viewModel.segments.enumerated() {
            
            if index >= segmentControl.numberOfSegments {
                segmentControl.insertSegment(withTitle: segment, at: index, animated: false)
            } else {
                segmentControl.setTitle(segment, forSegmentAt: index)
            }
        }
        
        segmentControl.selectedSegmentIndex = viewModel.selectedSegmentIndex
        
        updateColors(viewColors: viewModel.viewColors())
    }
    
    func updateColors(viewColors colors: DSDesignableViewColors) {
        backgroundColor = colors.background
    }
    
    @IBAction func didTapOnSegment(_ sender: Any) {
        
        guard let viewModel = self.viewModel else {
            return
        }
        
        guard segmentControl.selectedSegmentIndex < viewModel.segments.count else {
            return
        }
        
        viewModel.selectedSegmentIndex = segmentControl.selectedSegmentIndex
        let segmentText = viewModel.segments[segmentControl.selectedSegmentIndex]
        
        viewModel.didTapOnSegment?(DSSegmentIndex(title: segmentText, index: segmentControl.selectedSegmentIndex))
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    class func instanceFromNib() -> DSSegmentUIView {
        let view: DSSegmentUIView = initFromNib()
        return view
    }
}

