//
//  SplunkMintLogEvent.swift
//  TSLogEvent
//
//  Created by Layton, James on 5/26/21.
//  Copyright © 2021 Title Source. All rights reserved.
//

import Foundation
import SplunkMint

class SplunkMintLogEvent: NSObject, TSLogEventInterface {
    
    /// This property MUST be set to use this class.
    var configuration: SplunkMintConfig?
    
    /// Initialize another logging SDK.
    func initializeSDK() {
        if let configuration = configuration {
            Mint.sharedInstance()?.disableCrashReporter()
            Mint.sharedInstance().initAndStartSession(withHECUrl: configuration.hecURL, token: configuration.token)
                    
            let allAppEnvironments = [Environment.dev: SPLAppEnvDevelopment,
                                   Environment.test: SPLAppEnvTesting,
                                   Environment.uat: SPLAppEnvUserAcceptanceTesting,
                                   Environment.release: SPLAppEnvRelease]
            
            Mint.sharedInstance().applicationEnvironment = allAppEnvironments[configuration.appEvironment]
                    
#if DEBUG
            Mint.sharedInstance()?.enableDebugLog(true)
#endif
        }
    }
    
    /// Set the user's username for logging.
    /// - Parameter username: An username for analytics
    func setUsername(_ username: String) {
        Mint.sharedInstance()?.userIdentifier = username
    }
    
    /// Log an user event. Event name should be an NSString.
    /// - Parameter eventName: An name for event
    func logEvent(_ eventName: String) {
        Mint.sharedInstance()?.logEvent(withName: eventName, logLevel: MintLogLevel.init(10))
    }
    
    /// Log an user error. Event name should be an NSString.
    /// - Parameters:
    ///   - eventName: An name for event
    ///   - error: Error generated from the event
    func logEvent(_ eventName: String, error: Error) {
        let extraData = MintLimitedExtraData()
        extraData.setValue("\((error as NSError).code)", forKey: "ErrorCode")
        extraData.setValue(error.localizedDescription, forKey: "ErrorMessage")
        Mint.sharedInstance()?.logEvent(withName: eventName, logLevel: MintLogLevel.init(60), extraData: extraData)
    }
}
