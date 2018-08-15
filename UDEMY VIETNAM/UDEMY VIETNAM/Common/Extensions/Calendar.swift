//
//  Calendar.swift
//
//  Copyright © 2017 OPS PH. All rights reserved.
//

import Foundation

extension Calendar {

    static func getOrdinalDay(date: Date) -> String {

        let anchorComponents = current.dateComponents([.day, .month, .year], from: date)

        var day = "\(anchorComponents.day!)"
        
        switch (day) {
        case "1" , "21", "31":
            day.append("st")
        case "2" , "22":
            day.append("nd")
        case "3" ,"23":
            day.append("rd")
        default:
            day.append("th")
        }
        
        return day
    }

}
