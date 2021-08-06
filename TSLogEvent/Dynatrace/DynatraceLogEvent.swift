//
//  DynatraceLogEvent.swift
//  TSLogEvent
//
//  Created by Layton, James on 5/19/21.
//  Copyright © 2021 Title Source. All rights reserved.
//

import Foundation
import Dynatrace

class DynatraceLogEvent: NSObject, TSLogEventInterface {
    
    /// This property MUST be set to use this class.
    var configuration: DynatraceConfig?
    
    /// Initialize another logging SDK.
    func initializeSDK() {
        if let configuration = configuration {
            let dynatraceConfigDict = ["DTXAllowAnyCert": configuration.allowAnyCert,
                                       "DTXApplicationID": configuration.appID,
                                       "DTXBeaconURL": "https://bf06983hrt.bf.dynatrace.com/mbeacon",
                                       "DTXInstrumentAutoUserAction": configuration.instrumentAutoUserAction,
                                       "DTXUserOptIn": true] as [String: Any]
            
            Dynatrace.startup(withConfig: dynatraceConfigDict)

            let options = Dynatrace.userPrivacyOptions()
            options.dataCollectionLevel = .userBehavior
            options.crashReportingOptedIn = true
            options.crashReplayOptedIn = configuration.crashReplayOptedIn
            
            Dynatrace.applyUserPrivacyOptions(options) { (success) in
                if !success {
#if DEBUG
                print("Analytics Event: Dynatrace_ApplySettings_Failed")
#endif
                }
            }
        }
    }
    
    /// Set the user's username for logging.
    /// - Parameter username: An username for analytics
    func setUsername(_ username: String) {
        Dynatrace.identifyUser(username)
    }
    
    /// Log an user event. Event name should be an NSString that is no more than 40 characters long. Text will be truncated at 40 characters.
    /// - Parameter eventName: An name for event
    func logEvent(_ eventName: String) {
        let action = DTXAction.enter(withName: "UserAction")
        action?.reportEvent(withName: eventName)
        action?.leave()
    }
    
    /// Log an user error. Event name should be an NSString that is no more than 40 characters long. Text will be truncated at 40 characters. errorDescription should be no more than 100 characters.
    /// - Parameters:
    ///   - eventName: An name for event
    ///   - error: Error generated from the event
    func logEvent(_ eventName: String, error: Error) {
        DTXAction.reportError(withName: eventName, error: error)
    }
}
