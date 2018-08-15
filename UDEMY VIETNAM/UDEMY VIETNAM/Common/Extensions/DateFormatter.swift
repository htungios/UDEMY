//
//  DateFormatter.swift
//
//  Copyright © 2017 OPS. All rights reserved.
//

import Foundation

extension DateFormatter {
    
    static func gmtDateFormatter() -> DateFormatter {
        
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = NSTimeZone(abbreviation: "GMT")! as TimeZone
        dateFormatter.dateFormat = "E, dd MMM yyyy HH:mm:ss Z"
        return dateFormatter
        
    }
    
    static func utcDateFormatter() -> DateFormatter {

        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = NSTimeZone(abbreviation: "UTC")! as TimeZone
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
        dateFormatter.amSymbol = "AM"
        dateFormatter.pmSymbol = "PM"

        return dateFormatter
    }
    
    static func utcDateString(from date: Date) -> String {
        let dateFormat = DateFormatter.utcDateFormatter()
        dateFormat.dateFormat = "MMMM yyyy \t hh:mma"
        
        let newDate = dateFormat.string(from: date)

        let currentDay = DateFormatter.utcDateFormatter()
        currentDay.dateFormat = "d"

        let ordinalFormatter = NumberFormatter()
        ordinalFormatter.numberStyle = .ordinal

        var day = ""

        if let dayInteger = Int(currentDay.string(from: date)) {
            let dayNumber = NSNumber(value: dayInteger)
            day = ordinalFormatter.string(from: dayNumber)!
        }

        return day + " " + newDate
    }

}

extension Formatter {
    static let iso8601: DateFormatter = {
        let formatter = DateFormatter()
        formatter.calendar = Calendar(identifier: .iso8601)
        formatter.dateFormat = "yyyy-MM-dd'T'hh:mm:ss"
        return formatter
    }()
    
    static let iso8601Second: DateFormatter = {
        let formatter = DateFormatter()
        formatter.calendar = Calendar(identifier: .iso8601)
        formatter.dateFormat = "yyyy-MM-dd'T'hh:mm:ss.SSS"
        return formatter
    }()
    
    static let normalDate: DateFormatter = {
        let formatter = DateFormatter()
        formatter.calendar = Calendar(identifier: .iso8601)
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter
    }()
}
extension Date {
    var iso8601: String {
        return Formatter.iso8601.string(from: self)
    }
    
    var iso8601Second: String {
        return Formatter.iso8601Second.string(from: self)
    }
    
    static func normalDateString(with date: Date) -> String {
        let formatter = DateFormatter()
        // initially set the format based on your datepicker date
        formatter.dateFormat = "MM/dd/yyyy"
        
        let myStringafd = formatter.string(from: date)
        
        return myStringafd
    }
    
    static func fullDateString(with date: Date) -> String {
        let formatter = DateFormatter()
        // initially set the format based on your datepicker date
        formatter.dateFormat = "MM/dd/yyyy hh:mm"
        
        let myStringafd = formatter.string(from: date)
        
        return myStringafd
    }
}

extension String {
    var dateFromISO8601: Date? {
        return Formatter.iso8601.date(from: self)
    }
    
    var dateFromISO8601Second: Date? {
        return Formatter.iso8601Second.date(from: self)
    }
    
    var dateFromNormal: Date? {
        return Formatter.normalDate.date(from: self)
    }
}
