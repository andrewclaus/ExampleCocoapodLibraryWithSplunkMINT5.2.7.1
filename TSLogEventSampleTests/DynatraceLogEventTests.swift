//
//  DynatraceLogEventTests.swift
//  TSLogEventSampleTests
//
//  Created by Layton, James on 7/22/21.
//  Copyright © 2021 Title Source. All rights reserved.
//

import XCTest

class DynatraceLogEventTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testSetUsername_WithUsername_NotNil() {
        // Arrange
        let testDynatraceEvent = DynatraceLogEvent()
        
        // Assert
        XCTAssertNotNil(testDynatraceEvent.setUsername("TestUsername"))
    }

    func testLogEvent_WithEventName_NotNil() {
        // Arrange
        let testDynatraceEvent = DynatraceLogEvent()
        
        // Assert
        XCTAssertNotNil(testDynatraceEvent.logEvent("TestEvent"))
    }
    
    func testLogEvent_WithEventNameAndError_NotNil() {
        // Arrange
        let testDynatraceEvent = DynatraceLogEvent()
        let testError = NSError(domain: "Test", code: 999, userInfo: nil)
        
        // Assert
        XCTAssertNotNil(testDynatraceEvent.logEvent("TestEvent", error: testError))
    }
}
