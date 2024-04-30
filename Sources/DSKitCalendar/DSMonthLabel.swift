//
//  HCDayLabel.swift
//  DSKit
//
//  Created by Borinschi Ivan on 23.12.2020.
//

import HorizonCalendar
import UIKit

struct DSMonthLabel: CalendarItemViewRepresentable {
    
    /// Properties that are set once when we initialize the view.
    struct InvariantViewProperties: Hashable {
        let font: UIFont
        var textColor: UIColor
    }
    
    /// Properties that will vary depending on the particular date being displayed.
    struct ViewModel: Equatable {
        let month: Month
    }
    
    static func makeView(withInvariantViewProperties invariantViewProperties: InvariantViewProperties) -> UILabel {
        
        let label = UILabel()
        label.font = invariantViewProperties.font
        label.textColor = invariantViewProperties.textColor
        
        label.textAlignment = .left
        label.clipsToBounds = true
        
        return label
    }
    
    static func setViewModel(_ viewModel: ViewModel, on view: UILabel) {
        
       let date = Calendar.current.date(from: viewModel.month.components)
        
        guard let text = date?.stringFormattedMonth() else {
            return
        }
        
        view.text = text
    }
}
