//
//  OperationsHandler.swift
//  jumboChallenge
//
//  Created by Patrick Wawrzoszek on 2020-01-19.
//  Copyright © 2020 Patrick Wawrzoszek. All rights reserved.
//

import Foundation

// Will handle business logic of managing and update operations
class OperationsHandler {
    var operations: [Operation]
    
    init () {
        self.operations = [Operation]()
    }
    
    func handleMessage(message: Any) {
        print(message)
    }
    
    func startOperation(id: String) -> IndexPath {
        guard let newOperation = Operation(name: id, progress: 0, state: "") else {
            fatalError("Starting new operation with id \(id) failed")
        }
        
        let newIndexPath = IndexPath(row: operations.count, section: 0)
        operations.append(newOperation)
        
        return newIndexPath
    }
}
