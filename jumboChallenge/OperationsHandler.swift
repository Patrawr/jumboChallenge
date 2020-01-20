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
    func handleMessage(message: Any) -> IndexPath {
        print(message)
        
        let messageDict = convertMessageToDict(messageObject: message)
        let operationIndex = findOperationIndex(messageId: messageDict["id"])
        parseMessageType(message: messageDict, opIndex: operationIndex)
        
        let newIndexPath = IndexPath(row: operationIndex, section: 0)
        
        return newIndexPath
    }
    
    // Will parse key message to determine what type of message it is, i.e. "progress, completed"
    private func parseMessageType(message: [String: Any?], opIndex: Int) {
        // Casting any? optional to useable string
        let messageTypeStr: String = message["message"] as! String
        print("Message Type: \(messageTypeStr)")
        
        // Calculate new progress as a float for uiProgressView
        if messageTypeStr == "progress" {
            let newProgress : Float = message["progress"] as! Float
            operations[opIndex].progress = newProgress / 100.0
            operations[opIndex].state = "In Progress..."
        }
            
        else if messageTypeStr == "completed" {
            let stateStr : String = message["state"] as! String
            
            if stateStr == "success" {
                // We've completed successfully so set progressView to 100%
                operations[opIndex].progress = 1.0
                operations[opIndex].state = "✅"
            }
                
            else if stateStr == "error" {
                operations[opIndex].state = "❌"
            }
        }
            
        else {
            print("Invalid message type")
            return
        }
    }
    
    
    private func convertMessageToDict(messageObject: Any) -> Dictionary <String, Any> {
        //convert message payload into dicionary
        guard let msgString = messageObject as? String else {
            fatalError("Message not successfully converted to string")
        }
        
        guard let data: Data = msgString.data(using: .utf8) else {
            fatalError("Message not successfully converted to data")
        }
        
        let jsonString = try? JSONSerialization.jsonObject(with: data, options: [])
        var messageDict = jsonString as! [String: Any]
        
        return messageDict
    }
    
    // Searches the operation array and finds the operation with the same messageID
    private func findOperationIndex(messageId: Any?) -> Int {
        var foundOperationIndex : Int = 0
        
        let messageStr: String = messageId as! String
        
        for (index, operation) in operations.enumerated() {
            if operation.name == messageStr {
                foundOperationIndex = index
            }
        }
        
        return foundOperationIndex
    }
    
    // Creates a new operation and adds it to the internal array for tracking. Also, returns an index path so the
    // uiTableView knows where to insert a new row
    func startOperation(id: String) -> IndexPath {
        guard let newOperation = Operation(name: id, progress: 0, state: "") else {
            fatalError("Starting new operation with id \(id) failed")
        }
        
        let newIndexPath = IndexPath(row: operations.count, section: 0)
        operations.append(newOperation)
        
        return newIndexPath
    }
}
