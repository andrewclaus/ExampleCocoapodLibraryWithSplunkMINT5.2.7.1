//
//  Date+FormattedToStrings.swift
//  SwiftUtilityCollection
//
//  Created by Layton, James on 2/4/21.
//  Copyright © 2021 Johnston, Amelia. All rights reserved.
//

import Foundation

public extension Date {
    
    private func convertToString(format: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: self)
    }
    
    /// Convert date to string with paramter format.
    /// - Returns: Formatted string from date with format. Ex: 2021-02-04T14:05:28
    func formattedParameterString() -> String {
        let format = "yyyy-MM-dd'T'HH:mm:ss"
        return convertToString(format: format)
    }
    
    /// Convert date to string with time zone.
    /// - Returns: Formatted string from date with format. Ex: 2021-07-20 10:48:10 -04:00
    func formattedWithISOTimeZone() -> String {
        let format = "yyyy-MM-dd HH:mm:ss ZZZZZ"
        return convertToString(format: format)
    }
    
    /// Convert date to string with hour and minute format.
    /// - Returns: Formatted string from date with format "h:mm". Ex: 2:06
    func formattedTime() -> String {
        let format = "h:mm"
        return convertToString(format: format)
    }
    
    /// Convert date to string with AmPm format.
    /// - Returns: Formatted string from date with format "a". Ex: PM
    func formattedAmPm() -> String {
        let format = "a"
        return convertToString(format: format)
    }
    
    /// Convert date to string with abbreviated month and date format.
    /// - Returns: Formatted string from date with format "MMM. d". Ex: Feb. 4
    func formattedDate() -> String {
        let format = "MMM. d"
        return convertToString(format: format)
    }
    
    /// Convert date to string with month, date, and year format.
    /// - Returns: Formatted string from date with format "MM/dd/yyyy". Ex: 02/04/2021
    func formattedDateUsingSlash() -> String {
        let format = "MM/dd/yyyy"
        return convertToString(format: format)
    }
    
    /// Convert date to string with month and date format.
    /// - Returns: Formatted string from date with format "MM/d". Ex: 02/4
    func formattedShortDateUsingSlash() -> String {
        let format = "MM/d"
        return convertToString(format: format)
    }
    
    /// Convert date to string with abbreviated month, date, and year format.
    /// - Returns: Formatted string from date with format "MMM. d, yyyy". Ex: Feb. 4, 2021
    func formattedShortDate() -> String {
        let format = "MMM. d, yyyy"
        return convertToString(format: format)
    }
    
    /// Convert date to string with day of the week, abbreviated month, date, and year format.
    /// - Returns: Formatted string from date with format "EEEE, MMM. d, yyyy". Ex: Thursday, Feb. 4, 2021
    func formattedLongDate() -> String {
        let format = "EEEE, MMM. d, yyyy"
        return convertToString(format: format)
    }
    
    /// Convert date to string with hour, minute, AmPm, abbreviated day of the week, abbreviated month, and date format.
    /// - Returns: Formatted string from date with format "h:mm a E, MMM. d". Ex: 2:08 PM Thu, Feb 4
    func formattedShortDateTime() -> String {
        let format = "h:mm a E, MMM. d"
        return convertToString(format: format)
    }
    
    /// Convert date to string with abbreviated month format.
    /// - Returns: Formatted string from date with format "MMM.". Ex: Feb.
    func formattedMonth() -> String {
        let format = "MMM."
        return convertToString(format: format)
    }
    
    /// Convert date to string with day of the week format.
    /// - Returns: Formatted string from date with format "EEEE". Ex: Thursday
    func formattedDay() -> String {
        let format = "EEEE"
        return convertToString(format: format)
    }
    
    /// Convert date to string with abbreviated week format.
    /// - Returns: Formatted string from date with format "EEE". Ex: Thu
    func formattedShortDay() -> String {
        let format = "EEE"
        return convertToString(format: format)
    }
    
    /// Convert date to string with abbreviated month, date, year, hour, minunte, and AmPm format.
    /// - Returns: Formatted string from date with format "MMM. d, yyyy h:mm a". Ex: Feb. 4, 2021 2:10 PM
    func formattedLongDateTime() -> String {
        let format = "MMM. d, yyyy h:mm a"
        return convertToString(format: format)
    }
    
    /// Determine the appropriate suffix for a given date.
    /// - Returns: A string of date suffix.
    func daySuffix() -> String {
        var suffixStr = ""
        let dayOfMonth = Calendar.current.component(.day, from: self)
        switch dayOfMonth {
        case 1, 21, 31:
            suffixStr = "st"
        
        case 2, 22:
            suffixStr = "nd"
            
        case 3, 23:
            suffixStr = "rd"
            
        default:
            suffixStr = "th"
        }
        
        return suffixStr
    }
}
