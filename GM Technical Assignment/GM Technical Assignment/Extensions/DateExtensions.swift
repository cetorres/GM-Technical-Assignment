//
//  DateExtensions.swift
//  GM Technical Assignment
//
//  Created by Carlos Torres on 10/29/20.
//

import Foundation

extension Date {
    /// Format: HH:mm
    var shortTime: String {
        get {
            let dateFormatter = DateFormatter()
            dateFormatter.locale = .current
            dateFormatter.dateFormat = "h:mm a"
            return dateFormatter.string(from: self)
        }
    }
    /// Format: M/d/yy
    var shortDate: String {
        get {
            let dateFormatter = DateFormatter()
            dateFormatter.locale = .current
            dateFormatter.dateFormat = "M/d/yy"
            return dateFormatter.string(from: self)
        }
    }
    /// Format: M/d/yy h:mm a
    var shortDateTime: String {
        get {
            let dateFormatter = DateFormatter()
            dateFormatter.locale = .current
            dateFormatter.dateFormat = "M/d/yy h:mm a"
            return dateFormatter.string(from: self)
        }
    }
    /// Calculate difference between two dates in a specific calendar component
    func distance(from date: Date, only component: Calendar.Component, calendar: Calendar = .current) -> Int {
        let days1 = calendar.component(component, from: self)
        let days2 = calendar.component(component, from: date)
        return days1 - days2
    }
    /// Check if a date has the same calendar component than another date
    func hasSame(_ component: Calendar.Component, as date: Date) -> Bool {
        distance(from: date, only: component) == 0
    }
}
