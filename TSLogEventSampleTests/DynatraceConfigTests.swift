//
//  DynatraceConfigTests.swift
//  TSLogEventSampleTests
//
//  Created by Bortas, Flavius on 5/19/21.
//  Copyright © 2021 Title Source. All rights reserved.
//

import XCTest

class DynatraceConfigTests: XCTestCase {
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testInit_WithAppID_ReturnsAppID() {
        // Arrange
        let testAppID = "Test"
        let testCert = "YES"
        
        // Act
        let config = DynatraceConfig.init(appID: testAppID, allowAnyCert: testCert)
        
        // Assert
        XCTAssertEqual(testAppID, config.appID)
    }
    
    func testInit_WithAppID_ReturnsAllowAnyCert() {
        // Arrange
        let testAppID = "Test"
        let testCert = "YES"
        
        // Act
        let config = DynatraceConfig.init(appID: testAppID, allowAnyCert: testCert)
        
        // Assert
        XCTAssertEqual(testCert, config.allowAnyCert)
    }
}
