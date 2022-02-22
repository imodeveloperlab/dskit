//
//  HCDayLabel.swift
//  DSKit
//
//  Created by Borinschi Ivan on 23.12.2020.
//

import UIKit
import HorizonCalendar

// MARK: - DayRangeIndicatorView

final class DSDayRangeIndicatorView: UIView {
    
    // MARK: Lifecycle
    
    init(indicatorColor: UIColor) {
        
        self.indicatorColor = indicatorColor
        super.init(frame: .zero)
        backgroundColor = .clear
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Internal
    
    var framesOfDaysToHighlight = [CGRect]() {
        didSet {
            guard framesOfDaysToHighlight != oldValue else { return }
            setNeedsDisplay()
        }
    }
    
    override func draw(_ rect: CGRect) {
        
        let context = UIGraphicsGetCurrentContext()
        context?.setFillColor(indicatorColor.cgColor)
        
        if traitCollection.layoutDirection == .rightToLeft {
            transform = .init(scaleX: -1, y: 1)
        } else {
            transform = .identity
        }
        
        // Get frames of day rows in the range
        var dayRowFrames = [CGRect]()
        var currentDayRowMinY: CGFloat?
        for dayFrame in framesOfDaysToHighlight {
            if dayFrame.minY != currentDayRowMinY {
                currentDayRowMinY = dayFrame.minY
                dayRowFrames.append(dayFrame)
            } else {
                let lastIndex = dayRowFrames.count - 1
                dayRowFrames[lastIndex] = dayRowFrames[lastIndex].union(dayFrame)
            }
        }
        
        // Draw rounded rectangles for each day row
        for dayRowFrame in dayRowFrames {
            let cornerRadius = dayRowFrame.height / 2
            let roundedRectanglePath = UIBezierPath(roundedRect: dayRowFrame, cornerRadius: cornerRadius)
            context?.addPath(roundedRectanglePath.cgPath)
            context?.fillPath()
        }
    }
    
    // MARK: Private
    private let indicatorColor: UIColor
    
}

// MARK: CalendarItemViewRepresentable

extension DSDayRangeIndicatorView: CalendarItemViewRepresentable {
    
    struct InvariantViewProperties: Hashable {
        var indicatorColor: UIColor
    }
    
    struct ViewModel: Equatable {
        let framesOfDaysToHighlight: [CGRect]
    }
    
    static func makeView(withInvariantViewProperties invariantViewProperties: InvariantViewProperties) -> DSDayRangeIndicatorView {
        DSDayRangeIndicatorView(indicatorColor: invariantViewProperties.indicatorColor)
    }
    
    static func setViewModel(_ viewModel: ViewModel, on view: DSDayRangeIndicatorView) {
        view.framesOfDaysToHighlight = viewModel.framesOfDaysToHighlight
    }
}
