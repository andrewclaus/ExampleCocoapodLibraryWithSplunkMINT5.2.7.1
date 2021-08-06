//
//  TSLogHistory.swift
//  TSLogEvent
//
//  Created by Bortas, Flavius on 7/19/21.
//  Copyright © 2021 Title Source. All rights reserved.
//

import Foundation

class TSLogHistory {
    var allLogs: String = ""
        
    static let shared = TSLogHistory()
    
    private init() {
        clearLogs()
    }
    
    func logHistory() -> String {
       return allLogs
    }
    
    func addLog(message: String) {
        if message.count > 0 && !message.isEmpty {
            allLogs += "\(message)\n"
        }
    }
    
    func clearLogs() {
        allLogs = ""
    }
}
