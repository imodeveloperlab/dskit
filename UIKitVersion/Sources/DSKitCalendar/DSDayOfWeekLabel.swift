//
//  HCDayLabel.swift
//  DSKit
//
//  Created by Borinschi Ivan on 23.12.2020.
//

import UIKit
import HorizonCalendar

struct DSDayOfWeekLabel: CalendarItemViewRepresentable {
    
    /// Properties that are set once when we initialize the view.
    struct InvariantViewProperties: Hashable {
        let font: UIFont
        var textColor: UIColor
    }
    
    /// Properties that will vary depending on the particular date being displayed.
    struct ViewModel: Equatable {
        let month: Month?
        let day: Int
    }
    
    static func makeView(withInvariantViewProperties invariantViewProperties: InvariantViewProperties) -> UILabel {
        
        let label = UILabel()
        label.font = invariantViewProperties.font
        label.textColor = invariantViewProperties.textColor
        
        label.textAlignment = .center
        label.clipsToBounds = true
        
        return label
    }
    
    static func setViewModel(_ viewModel: ViewModel, on view: UILabel) {
            
        guard var components = viewModel.month?.components else {
            return
        }
        
        components.day = viewModel.day
        
        let date = Calendar.current.date(from: components)
        
        guard let text = date?.stringFormattedWeekDay(dateStyle: .short) else {
            return
        }
        
        view.text = text
    }
}
