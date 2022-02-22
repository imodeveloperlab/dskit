//
//  HCDayLabel.swift
//  DSKit
//
//  Created by Borinschi Ivan on 23.12.2020.
//

import UIKit
import HorizonCalendar
import DSKit

struct DSDayLabel: CalendarItemViewRepresentable {
    
    /// Properties that are set once when we initialize the view.
    struct InvariantViewProperties: Hashable {
        let font: UIFont
        var textColor: UIColor
        var backgroundColor: UIColor
        var alpha: CGFloat
    }
    
    /// Properties that will vary depending on the particular date being displayed.
    struct ViewModel: Equatable {
        let day: Day
    }
    
    static func makeView(withInvariantViewProperties invariantViewProperties: InvariantViewProperties) -> UILabel {
        
        let label = UILabel()
        
        label.backgroundColor = invariantViewProperties.backgroundColor
        label.font = invariantViewProperties.font
        label.textColor = invariantViewProperties.textColor
        
        label.textAlignment = .center
        label.clipsToBounds = true
        label.layer.cornerRadius = DSAppearance.shared.main.secondaryView.cornerRadius
        label.alpha = invariantViewProperties.alpha
        
        return label
    }
    
    static func setViewModel(_ viewModel: ViewModel, on view: UILabel) {
        view.text = "\(viewModel.day.day)"
    }
}
