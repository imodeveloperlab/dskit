//
//  DateExtension.swift
//  DSKit
//
//  Created by Borinschi Ivan on 30.11.2020.
//  Copyright © 2021 Borinschi Ivan. All rights reserved.
//

import Foundation

public extension Date {
    
    /// Get string formatted date and time
    /// - Parameters:
    ///   - timeZoneAbbreviation: Set time zone abbreviation, Example: "GMT+0:00"
    ///   - dateStyle: Date format style, default .medium
    ///   - timeStyle: Time format style, default .short
    /// - Returns: Formatted string
    func stringFormatted(timeZoneAbbreviation: String? = nil,
                         dateStyle: DateFormatter.Style = .medium,
                         timeStyle: DateFormatter.Style = .short) -> String {
        
        let formatter = DateFormatter()
        formatter.calendar = Calendar.current
        formatter.dateStyle = dateStyle
        formatter.timeStyle = timeStyle
        
        if let timeZone = timeZoneAbbreviation {
            formatter.timeZone = TimeZone(abbreviation: timeZone)
        }
        
        return formatter.string(from: self)
    }
    
    /// Get date day formatted string
    /// - Parameters:
    ///   - timeZoneAbbreviation: Set time zone abbreviation, Example: "GMT+0:00"
    /// - Returns: Formatted string
    func stringFormattedDay(timeZoneAbbreviation: String = "GMT+0:00") -> String {
        
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = TimeZone(abbreviation: timeZoneAbbreviation)
        dateFormatter.dateFormat = "dd"
        let dayString = dateFormatter.string(from: self)
        
        return dayString
    }
    
    /// Get date hour formatted string
    /// - Parameters:
    ///   - timeZoneAbbreviation: Set time zone abbreviation, Example: "GMT+0:00"
    /// - Returns: Formatted string
    func stringFormattedHour(timeZoneAbbreviation: String = "GMT+0:00") -> String {
        
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = TimeZone(abbreviation: timeZoneAbbreviation)
        dateFormatter.dateFormat = "HH:mm"
        let dayString = dateFormatter.string(from: self)
        
        return dayString
    }
    
    /// Get date month formatted string
    /// - Parameters:
    ///   - timeZoneAbbreviation: Set time zone abbreviation, Example: "GMT+0:00"
    ///   - dateFormat: Date format: Example "MMMM" for month
    /// - Returns: Formatted string
    func stringFormattedMonth(timeZoneAbbreviation: String = "GMT+0:00",
                              dateFormat: String = "MMMM") -> String {
        
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = TimeZone(abbreviation: timeZoneAbbreviation)
        dateFormatter.dateFormat = dateFormat
        let monthString = dateFormatter.string(from: self)
        
        return monthString
    }
    
    /// Get string formatted week day
    ///   - timeZoneAbbreviation: Set time zone abbreviation, Example: "GMT+0:00"
    ///   - dateFormat: Date format: Example "EEE" for week day
    /// - Returns: Formatted string
    func stringFormattedWeekDay(timeZoneAbbreviation: String = "GMT+0:00",
                                dateStyle: DateFormatter.Style = .medium,
                                dateFormat: String = "EEE") -> String {
        
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = TimeZone(abbreviation: "GMT+0:00")
        dateFormatter.dateStyle = dateStyle
        dateFormatter.dateFormat = dateFormat
        return dateFormatter.string(from: self)
    }
    
    /// Get string formatted year
    /// - Parameters:
    ///   - timeZoneAbbreviation: Set time zone abbreviation, Example: "GMT+0:00"
    ///   - dateFormat: "YYYY"
    /// - Returns: Formatted string
    func stringFormattedYear(timeZoneAbbreviation: String = "GMT+0:00",
                             dateFormat: String = "YYYY") -> String {
        
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = TimeZone(abbreviation: timeZoneAbbreviation)
        dateFormatter.dateFormat = dateFormat
        let yearString = dateFormatter.string(from: self)
        return yearString
    }
}

public extension Date {
    
    /// Get date from string with specific format
    /// - Parameters:
    ///   - dateString: Date string, Example: "22 09 2020"
    ///   - dateFormat: Date format string, Example: "dd MM yyyy"
    ///   - timeZoneAbbreviation: Set time zone abbreviation, Example: "GMT+0:00"
    ///   - localeIdentifier: Locale identifier, Example: "en_US"
    /// - Returns: Date?
    static func dateFrom(string dateString: String?,
                         dateFormat: String = "dd MM yyyy",
                         timeZoneAbbreviation: String = "GMT+0:00",
                         localeIdentifier: String = "en_US") -> Date? {
        
        guard let dateString = dateString else {
            return nil
        }
        
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: localeIdentifier)
        dateFormatter.dateFormat = dateFormat
        dateFormatter.timeZone = TimeZone(abbreviation: timeZoneAbbreviation)
        let date = dateFormatter.date(from: dateString)
        
        return date
    }
}
