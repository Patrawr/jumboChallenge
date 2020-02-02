//
//  jumboChallengeTests.swift
//  jumboChallengeTests
//
//  Created by Patrick Wawrzoszek on 2020-01-15.
//  Copyright © 2020 Patrick Wawrzoszek. All rights reserved.
//

import XCTest
import WebKit
@testable import jumboChallenge

class jumboChallengeTests: XCTestCase {
    var opHandlerTest: OperationsHandler!
    

    override func setUp() {
        super.setUp()
        opHandlerTest = OperationsHandler()
    }

    override func tearDown() {
        opHandlerTest = nil
        super.tearDown()
    }

    func testEmptyMessage() {
        let emptyMessageOperation = Operation(name: "", progress: 0, state: "")
        XCTAssertNil(emptyMessageOperation)
        
    }
    
    func testInvalidProgress() {
        let invalidProgressOperation = Operation(name: "invalidProgressTest", progress: -1, state: "")
        XCTAssertNil(invalidProgressOperation)
    }
    
    class MockOperationMessage : WKScriptMessage {
        let mockBody: Any
        let mockName: String
        
        init(name: String, body: Any) {
            mockName = name
            mockBody = body
        }
        
        override var body: Any {
            return mockBody
        }
        
        override var name: String {
            return mockName
        }
    }
    
    // Test that an operation has been successfully started
    func testStartOperationName() {
        var id = String(Int.random(in: 0..<1000000))
        id = id + "jmb"
        
        opHandlerTest.startOperation(id: id)
        XCTAssertEqual(opHandlerTest.operations[0].name, id, "Message ID started does not match in opHandler")
    }
    
    // Check if the message handler receives a valid message
    func testOperationMessageHandlerValid() {
        var id = String(Int.random(in: 0..<1000000))
        id = id + "jmb"
        
        opHandlerTest.startOperation(id: id)
        
        // Generate mock message and send to message handler
        let mockMessage = MockOperationMessage(name: "jumbo", body: "{\"id\":\"\(id)\",\"message\":\"progress\",\"progress\":50}")
        opHandlerTest.handleMessage(message: mockMessage.mockBody)
        
        XCTAssertEqual(opHandlerTest.operations[0].progress, 0.5, "Progress not updated correctly")
    }
    
    // Check if the message handler handles a malformed message
    func testOperationMessageHandlerMalformedMessage() {
        var id = String(Int.random(in: 0..<1000000))
        id = id + "jmb"
        
        opHandlerTest.startOperation(id: id)
        
        // Generate mock message and send to message handler
        let mockMessage = MockOperationMessage(name: "jumbo", body: "{\"id\":\"\(id)\",\"message\":\"\",\"progress\":10}")
        opHandlerTest.handleMessage(message: mockMessage.mockBody)
        
        XCTAssertEqual(opHandlerTest.operations[0].progress, 0, "Invalid Message Modified Progress when it shouldn't have")
    }
    
    // Check if the message handler handles an invalid message properly
    func testOperationMessageHandlerInvalidMessage() {
        var id = String(Int.random(in: 0..<1000000))
        id = id + "jmb"
        
        opHandlerTest.startOperation(id: id)
        
        // Generate mock message and send to message handler
        let mockMessage = MockOperationMessage(name: "jumbo", body: "Invalid corrupted message")
        opHandlerTest.handleMessage(message: mockMessage.mockBody)
        
        XCTAssertEqual(opHandlerTest.operations[0].progress, 0, "Invalid Message Modified Progress when it shouldn't have")
    }


}
