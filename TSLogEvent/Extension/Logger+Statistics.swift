//
//  Logger+Statistics.swift
//  TSLogEvent
//
//  Created by Bortas, Flavius on 7/20/21.
//  Copyright © 2021 Title Source. All rights reserved.
//

import Foundation
import os.log

@available(iOS 14.0, *)
extension Logger {
    
    /// Set the subsystem for logger
    private static var subsystem = Bundle.main.bundleIdentifier
    
    /// initianize the Logger. Creates a custom logger for logging to a specific subsystem and category.
    static let logEvent = Logger(subsystem: subsystem ?? "", category: "TSLogEvent")
}
