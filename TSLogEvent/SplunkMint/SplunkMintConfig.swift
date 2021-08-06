//
//  SplunkMintConfig.swift
//  TSLogEvent
//
//  Created by Layton, James on 5/26/21.
//  Copyright © 2021 Title Source. All rights reserved.
//

import Foundation

public class SplunkMintConfig: NSObject {
    /// The URL of the HEC MINT endpoint.
    @objc public var hecURL: String = ""

    /// The HEC input token.
    @objc public var token: String = ""
    
    /// Sets an application environment.
    @objc public var appEvironment: Environment

    @objc public init(hecURL: String, token: String, appEvironment: Environment) {
        self.hecURL = hecURL
        self.token = token
        self.appEvironment = appEvironment
    }
}
