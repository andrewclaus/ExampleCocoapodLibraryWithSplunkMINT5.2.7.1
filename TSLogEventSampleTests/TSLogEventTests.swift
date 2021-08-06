//
//  TSLogEventTests.swift
//  TSLogEventSampleTests
//
//  Created by Layton, James on 7/19/21.
//  Copyright © 2021 Title Source. All rights reserved.
//

import XCTest

let testUsername = "TestUsername"
let testEventName = "TestEventName"
let testErrorCode = 999

class TSLogEventTests: XCTestCase {
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        TSLogEvent.shared.logEventInterfaces.removeAll()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        TSLogEvent.shared.logEventInterfaces.removeAll()
    }
    
    func testAddSplunk_WithConfig_SplunkAdded() {
        // Arrange
        let logEvent = TSLogEvent.shared
        let testSplunkMintConfig = SplunkMintConfig(hecURL: "TestURL", token: "TestToken", appEvironment: .dev)
        
        // Act
        TSLogEvent.addSplunk(testSplunkMintConfig)
        
        // Assert
        XCTAssertTrue(logEvent.logEventInterfaces.count == 1)
    }
    
    func testLogToOtherSDK_WithOtherLogEvent_UsernameSet() {
        // Arrange
        let logEvent = TSLogEvent.shared
        let mockOtherLogEvent = MockOtherLogEvent()
        logEvent.logEventInterfaces.append(mockOtherLogEvent)
        
        // Act
        TSLogEvent.logToOtherSDK(username: testUsername, eventName: nil, error: nil)
    }
    
    func testLogToOtherSDK_WithOtherLogEvent_EventNameSet() {
        // Arrange
        let logEvent = TSLogEvent.shared
        let mockOtherLogEvent = MockOtherLogEvent()
        logEvent.logEventInterfaces.append(mockOtherLogEvent)
        
        // Act
        TSLogEvent.logToOtherSDK(username: nil, eventName: testEventName, error: nil)
    }
    
    func testLogToOtherSDK_WithOtherLogEvent_EventNameAndErrorSet() {
        // Arrange
        let logEvent = TSLogEvent.shared
        let mockOtherLogEvent = MockOtherLogEvent()
        logEvent.logEventInterfaces.append(mockOtherLogEvent)
        let testError = NSError(domain: "TestError", code: testErrorCode, userInfo: nil)
        
        // Act
        TSLogEvent.logToOtherSDK(username: nil, eventName: testEventName, error: testError)
    }
    
    func testSetUsername_WithUsername_UsernameHasBeenSet() {
        // Arrange
        let logEvent = TSLogEvent()
        let mockOtherLogEvent = MockOtherLogEvent()
        logEvent.logEventInterfaces.append(mockOtherLogEvent)
        
        // Act
        TSLogEvent.setUsername(testUsername)
    }
    
    func testLogEvent_WithEventName_EventNameHasBeenSet() {
        // Arrange
        let logEvent = TSLogEvent()
        let mockOtherLogEvent = MockOtherLogEvent()
        logEvent.logEventInterfaces.append(mockOtherLogEvent)
        
        // Act
        TSLogEvent.logEvent(testEventName)
    }
    
    func testLogEvent_WithEventNameAndError_EventNameAndErrorHasBeenSet() {
        // Arrange
        let logEvent = TSLogEvent()
        let mockOtherLogEvent = MockOtherLogEvent()
        logEvent.logEventInterfaces.append(mockOtherLogEvent)
        let testError = NSError(domain: "TestError", code: testErrorCode, userInfo: nil)
        
        // Act
        TSLogEvent.logEvent(testEventName, withError: testError)
    }
    
    func testPrint_returnsDebugMessage() {
        // Arrange
        var testPrintMessage = "****"
        
        // Act
        
        func testFunc() -> String {
            testPrintMessage = "Test ****"
            print("\(testPrintMessage)")
            
            return testPrintMessage
        }
        
        // Assert
        XCTAssertEqual(testFunc(), "Test ****")
    }
}

class MockOtherLogEvent: TSLogEventInterface {
    func initializeSDK() {
        // Do nothing
    }
    
    func setUsername(_ username: String) {
        XCTAssertEqual(username, testUsername)
    }
    
    func logEvent(_ eventName: String) {
        XCTAssertEqual(eventName, testEventName)
    }
    
    func logEvent(_ eventName: String, error: Error) {
        XCTAssertEqual(eventName, testEventName)
        XCTAssertEqual((error as NSError).code, testErrorCode)
    }
}
