//
//  DSCalendarViewController.swift
//  DSKit
//
//  Created by Borinschi Ivan on 22.12.2020.
//

import UIKit
import DSKit
import HorizonCalendar

open class DSCalendarViewController: DSViewController {
    
    let excludeDates: [Date]
    let startDate: Date
    let endDate: Date
    
    public var didSelectDate: ((Date) -> Void)?
    
    private var selectedDay: Day?
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        title = "Day"
        setUp()
    }
    
    public init(startDate: Date, endDate: Date, excludeDates: [Date]) {
        
        self.startDate = startDate
        self.endDate = endDate
        self.excludeDates = excludeDates
        super.init(nibName: nil, bundle: nil)
        hidesBottomBarWhenPushed = true
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Set up
extension DSCalendarViewController {
    
    func setUp() {
        
        // Add calendar view as subview
        let calendarView = CalendarView(initialContent: makeContent())
        view.addSubview(calendarView)
        
        // Set up calendar constraints
        calendarView.translatesAutoresizingMaskIntoConstraints = false
        calendarView.backgroundColor = appearance.primaryView.background
        NSLayoutConstraint.activate([
            calendarView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 7),
            calendarView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -7),
            calendarView.topAnchor.constraint(equalTo: view.topAnchor),
            calendarView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
        
        // Handle did select day in calendar
        calendarView.daySelectionHandler = { [weak self] day in
            
            guard let self = self else { return }
            
            // Set selected day
            self.selectedDay = day
            
            // Check is selected date is available
            if self.isSelectedDateAvailable() {
                
                guard let date = Calendar.current.date(from: day.components) else {
                    return
                }
                
                // Call did select date
                self.didSelectDate?(date)
                self.selectedDay = nil
            }
            
            // Update calendar content
            calendarView.setContent(self.makeContent())
        }
    }
}

// MARK: - Calendar content
extension DSCalendarViewController {
    
    /// Make calendar content
    /// - Returns: CalendarViewContent
    private func makeContent() -> CalendarViewContent {
        
        let calendar = Calendar.current
        
        let layout: MonthsLayout = .vertical(options: VerticalMonthsLayoutOptions())
        
        var content = CalendarViewContent(calendar: calendar,
                                              visibleDateRange: startDate...endDate,
                                              monthsLayout: layout)
        content = dayModels(for: content)
        content = spacing(for: content)
        content = tooltip(for: content)
        content = monthModels(for: content)
        content = weekModels(for: content)
        return content
    }
    
    /// Month view models for calendar content
    /// - Parameter content: CalendarViewContent
    /// - Returns: CalendarViewContent
    func monthModels(for content: CalendarViewContent) -> CalendarViewContent {
        
        return content.monthHeaderItemProvider { month -> AnyCalendarItemModel in
            
            let properties = DSMonthLabel.InvariantViewProperties(font: self.appearance.fonts.title2,
                                                                  textColor: self.appearance.primaryView.text.title1)
            
            return CalendarItemModel<DSMonthLabel>(invariantViewProperties: properties, viewModel: .init(month: month))
        }
    }
    
    /// Wee view models for calendar content
    /// - Parameter content: CalendarViewContent
    /// - Returns: CalendarViewContent
    func weekModels(for content: CalendarViewContent) -> CalendarViewContent {
        
        content.dayOfWeekItemProvider { (month, day) -> AnyCalendarItemModel in
            
            let properties = DSDayOfWeekLabel.InvariantViewProperties(font: self.appearance.fonts.subheadline.withSize(13),
                                                                      textColor: self.appearance.primaryView.text.subheadline)
            
            return CalendarItemModel<DSDayOfWeekLabel>(invariantViewProperties: properties, viewModel: .init(month: month, day: day))
        }
    }
    
    /// Day view models for calendar content
    /// - Parameter content: CalendarViewContent
    /// - Returns: CalendarViewContent
    func dayModels(for content: CalendarViewContent) -> CalendarViewContent {
        
        return content.dayItemProvider { day -> AnyCalendarItemModel in
            
            var properties = DSDayLabel.InvariantViewProperties(font: self.appearance.fonts.headline.withSize(15),
                                                                textColor: self.appearance.secondaryView.text.title1,
                                                                backgroundColor: self.appearance.secondaryView.background,
                                                                alpha: 1)
            
            // Current selected day
            if self.isSelectedDay(day: day) {
                properties.textColor = self.appearance.primaryView.button.title
                properties.backgroundColor = self.appearance.primaryView.button.background
            }
            
            // Excluded day
            if self.isExcludedDate(day: day) {
                properties.alpha = 0.5
                
                if self.isSelectedDay(day: day) {
                    properties.backgroundColor = self.appearance.brandColor.semanticRedColor
                }
            }
            
            return CalendarItemModel<DSDayLabel>(invariantViewProperties: properties,
                                                     viewModel: .init(day: day))
        }
    }
    
    /// Spacing for calendar content
    /// - Parameter content: CalendarViewContent
    /// - Returns: CalendarViewContent
    func spacing(for content: CalendarViewContent) -> CalendarViewContent {
        
        var content = content
        content = content.verticalDayMargin(appearance.interItemSpacing)
        content = content.horizontalDayMargin(appearance.interItemSpacing)
        content = content.interMonthSpacing(appearance.margins * 2)
        return content
    }
    
    /// Tooltip for calendar content
    /// - Parameter content: CalendarViewContent
    /// - Returns: CalendarViewContent
    func tooltip(for content: CalendarViewContent) -> CalendarViewContent {
        
        let calendar = Calendar.current
        
        let overlaidItemLocations: Set<CalendarViewContent.OverlaidItemLocation>
        if let selectedDay = selectedDay {
            let dateToOverlay = calendar.date(from: selectedDay.components)!
            overlaidItemLocations = [.day(containingDate: dateToOverlay)]
        } else {
            overlaidItemLocations = []
        }
        
        return content.withOverlayItemModelProvider(for: overlaidItemLocations) { overlayLayoutContext in
            
            let textColors = self.appearance.secondaryView.background
            let backgroundColor = self.appearance.primaryView.text.title1
            let borderColor = self.appearance.primaryView.text.subheadline
            let font = self.appearance.fonts.headline
            
            let properties = DSTooltipView.InvariantViewProperties(backgroundColor: backgroundColor,
                                                                   borderColor: borderColor,
                                                                   font: font,
                                                                   textAlignment: .center,
                                                                   textColor: textColors)
            
            let text = self.isSelectedDateAvailable() ? "Selected Date" : "Not available"
            
            return CalendarItemModel<DSTooltipView>(invariantViewProperties: properties,
                                                        viewModel: .init(frameOfTooltippedItem: overlayLayoutContext.overlaidItemFrame, text: text))
        }
    }
}

// MARK: - Helpers
extension DSCalendarViewController {
    
    /// Check if day is in exclude date
    /// - Parameter day: Day
    /// - Returns: Bool
    func isExcludedDate(day: Day) -> Bool {
        
        let calendar = Calendar.current
        
        if let date = calendar.date(from: day.components) {
            
            if self.excludeDates.contains(date) {
                return true
            }
            
            return date <= Date()
        }
        
        return false
    }
    
    /// Check if selected date is available
    /// - Returns: Bool
    func isSelectedDateAvailable() -> Bool {
        
        guard let date = self.selectedDay else {
            return false
        }
        
        return !isExcludedDate(day: date)
    }
    
    /// Check if day is selected day
    /// - Parameter day: Day
    /// - Returns: Bool
    func isSelectedDay(day: Day) -> Bool {
        return day == self.selectedDay
    }
}
