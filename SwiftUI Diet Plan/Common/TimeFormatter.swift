//
//  TimeFormatter.swift
//  SwiftUI Diet Plan
//
//  Created by Prashant Kumar Soni on 20/12/24.
//

import Foundation

final class TimeFormatter{
    static func formatTo12Hour(timeSlot: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        
        guard let date = dateFormatter.date(from: timeSlot) else {
            return timeSlot
        }
        
        dateFormatter.dateFormat = "ha"
        dateFormatter.amSymbol = "AM"
        dateFormatter.pmSymbol = "PM"
        
        return dateFormatter.string(from: date)
    }
}
