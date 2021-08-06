//
//  DynatraceConfig.swift
//  TSLogEvent
//
//  Created by Layton, James on 5/19/21.
//  Copyright © 2021 Title Source. All rights reserved.
//

import Foundation

public class DynatraceConfig: NSObject {
    /// An application ID to identifies your mobile app.
    @objc public var appID: String = ""

    /// Allows the use of self-signed certificates.
    @objc public var allowAnyCert: String = ""

    /// Track the steps that caused the crash. Default is NO.
    @objc public var crashReplayOptedIn: Bool = false

    /// Turns on the ability to automatically create user actions for user interactions with the app. Default is NO.
    @objc public var instrumentAutoUserAction: Bool = false

    @objc public init(appID: String, allowAnyCert: String) {
        self.appID = appID
        self.allowAnyCert = allowAnyCert
    }
}
