//
//  String+FormattedToDate.swift
//  SwiftUtilityCollection
//
//  Created by Layton, James on 2/5/21.
//  Copyright © 2021 Johnston, Amelia. All rights reserved.
//

import Foundation

public extension String {
    
    /// A function to convert most API string into date format.
    /// - Returns: A date from API date string.
    func dateFromAPIString() -> Date? {
        
        // first try a standard date/time format
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss" // 2021-02-04T14:05:28
        var date = dateFormatter.date(from: self)
        
        // if this does not work, next try adding milliseconds
        if date == nil {
            dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS" // 2021-02-05T11:54:08.144
            date = dateFormatter.date(from: self)
        }
        
        // With timezone
        if date == nil {
            dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ" // 2021-02-05T11:55:17-0500
            date = dateFormatter.date(from: self)
        }
        
        // With milliseconds and timezone
        if date == nil {
            dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ" // 2021-02-05T11:55:42.427-0500
            date = dateFormatter.date(from: self)
        }
        
        // Used to get security token expiration date from the userinfo object (and maintenance window dates)
        if date == nil {
            dateFormatter.dateFormat = "e, d MMM. y HH:mm:ss zzz" // 6, 5 Feb. 2021 11:56:48 EST
            date = dateFormatter.date(from: self)
        }
        
        // Another possible format for security token expiration date from the userinfo object
        if date == nil {
            dateFormatter.dateFormat = "EEE, dd MM yyyy HH:mm:ss zzz" // Fri, 05 02 2021 12:00:33 EST
            date = dateFormatter.date(from: self)
        }
        
        // treat a year zero date as nil
        return isYearZero(date) ? nil : date
    }
    
    private func isYearZero(_ date: Date?) -> Bool {
        
        guard let date = date else {
            return true
        }
        
        let nullDateString = "0001-01-01T00:00:00"
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        
        if let nullDate = dateFormatter.date(from: nullDateString) {
            return date.compare(nullDate) == .orderedSame
        }
        return false
    }
}
