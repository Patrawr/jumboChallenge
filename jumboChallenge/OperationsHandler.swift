//
//  OperationsHandler.swift
//  jumboChallenge
//
//  Created by Patrick Wawrzoszek on 2020-01-19.
//  Copyright © 2020 Patrick Wawrzoszek. All rights reserved.
//

import Foundation

// Will handle business logic of starting and updating operations
class OperationsHandler {
    //MARK: Properties
    var operations: [Operation]
    
    //MARK: Setup
    init () {
        self.operations = [Operation]()
    }
    
    
    //MARK: Custom Methods
    func handleMessage(message: Any) -> Int {
        // Reads in json message and returns a dictionary
        let messageDict = convertMessageToDict(messageObject: message)
        let operationIndex = findOperationIndex(messageId: messageDict["id"])
        
        // Handles main logic of parsing the message and updating the datamodel appropriately
        parseMessageType(message: messageDict, opIndex: operationIndex)
        
        return operationIndex
    }
    
    // Will parse key message to determine what type of message it is, i.e. "progress, completed"
    private func parseMessageType(message: [String: Any?], opIndex: Int) {
        // Casting any? optional to useable string
        let messageTypeStr: String = message["message"] as? String ?? ""
        
        // Calculate new progress as a float for uiProgressView
        if messageTypeStr == "progress" {
            if let newProgress : Float = message["progress"] as? Float {
            operations[opIndex].progress = newProgress / 100.0
            operations[opIndex].state = "In Progress..."
            }
        }
            
        // Handle completed message and update state, progressView appropriately
        else if messageTypeStr == "completed" {
            let stateStr : String = message["state"] as? String ?? ""
            
            if stateStr == "success" {
                // We've completed successfully so set progressView to 100%
                operations[opIndex].progress = 1.0
                operations[opIndex].state = "✅"
            }
                
            else if stateStr == "error" {
                operations[opIndex].state = "❌"
            }
            else {
                print("Invalid state \(stateStr)")
                return
            }
        }
            
            // log this message and skip if invalid
        else {
            print("Invalid message type \(messageTypeStr)")
            return
        }
    }
    
    
    private func convertMessageToDict(messageObject: Any) -> Dictionary <String, Any> {
        //convert json string message payload into dicionary
        guard let msgString = messageObject as? String else {
            fatalError("Message not successfully converted to string")
        }
        
        guard let data: Data = msgString.data(using: .utf8) else {
            fatalError("Message not successfully converted to data")
        }
        
        let jsonString = try? JSONSerialization.jsonObject(with: data, options: [])
        guard let messageDict = jsonString as? [String: Any] else {
            fatalError("Message \(data) not successfully converted to dictionary")
        }
        
        return messageDict
    }
    
    // Searches the operation array and finds the operation with the same messageID
    private func findOperationIndex(messageId: Any?) -> Int {
        var foundOperationIndex : Int = 0
        
        // if we can successfully unwrap the string, search for the index
        if let messageStr: String = messageId as? String {
            for (index, operation) in operations.enumerated() {
                if operation.name == messageStr {
                    foundOperationIndex = index
                }
            }
        }
        
        return foundOperationIndex
    }
    
    // Creates a new operation and adds it to the internal array for tracking. Also, returns an index path so the
    // uiTableView knows where to insert a new row
    func startOperation(id: String) -> Int {
        guard let newOperation = Operation(name: id, progress: 0, state: "") else {
            fatalError("Starting new operation with id \(id) failed")
        }
        
        let newOperationIndex: Int = operations.count
        operations.append(newOperation)
        
        return newOperationIndex
    }
}
