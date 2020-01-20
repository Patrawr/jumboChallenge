//
//  Operation.swift
//  jumboChallenge
//
//  Created by Patrick Wawrzoszek on 2020-01-18.
//  Copyright © 2020 Patrick Wawrzoszek. All rights reserved.
//

import UIKit

class Operation {
    //MARK: Properties
    var name: String
    var progress: Float
    var state: String
    
    //MARK: Init
    init?(name: String, progress: Float, state: String) {
        guard !name.isEmpty else {
            return nil
        }
        
        guard progress >= 0 && progress <= 1 else {
            return nil
        }
        
        self.name = name
        self.progress = progress
        self.state = state
    }
}
