//
//  LogHistoryTests.swift
//  TSLogEventSampleTests
//
//  Created by Bortas, Flavius on 7/19/21.
//  Copyright © 2021 Title Source. All rights reserved.
//

import XCTest

class LogHistoryTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testAddLog_addsLog() {
        // Arrange
        let logHistory = TSLogHistory.shared
        let testMessage = "TestMessage"
        
        // Act
        logHistory.clearLogs()
        logHistory.addLog(message: testMessage)
        
        // Assert
        XCTAssertNotNil(logHistory.allLogs)
    }
    
    func testLogHistory_retunsAllLogs() {
        // Arrange
        let logHistory = TSLogHistory.shared
        
        // Act
        logHistory.clearLogs()
        logHistory.addLog(message: "Test1")
        logHistory.addLog(message: "Test2")
                        
        // Assert
        
        XCTAssertTrue(!logHistory.logHistory().isEmpty)
    }

}
