//
//  TSLogEventInterface.swift
//  TSLogEvent
//
//  Created by Layton, James on 5/19/21.
//  Copyright © 2021 Title Source. All rights reserved.
//

import UIKit

protocol TSLogEventInterface {
    
    /// Initialize another logging SDK
    func initializeSDK()

    /// Set the user's username for logging.
    /// - Parameter username: An username for analytics
    func setUsername(_ username: String)

    /// Log an user event. Event name should be an NSString that is no more than 40 characters long. Text will be truncated at 40 characters.
    /// - Parameter eventName: An name for event
    func logEvent(_ eventName: String)

    /// Log an user error. Event name should be an NSString that is no more than 40 characters long. Text will be truncated at 40 characters. errorDescription should be no more than 100 characters.
    /// - Parameters:
    ///   - eventName: An name for event
    ///   - error: Error generated from the event
    func logEvent(_ eventName: String, error: Error)
}
