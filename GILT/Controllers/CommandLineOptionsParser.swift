//
//  CommandLineOptionsParser.swift
//  GILT
//
//  Created by Alessandro dos Santos Pinto on 17/05/2017.
//  Copyright © 2017 Alessandro dos Santos Pinto. All rights reserved.
//

import Foundation

struct CommandLineOptionsParser {
    let arguments: [String]
    
    init(arguments: [String] = CommandLine.arguments) {
        self.arguments = arguments
    }
    
    func inputFilePath() -> String? {
        guard arguments.count > 1 else {
            return nil
        }
        
        return arguments[1]
    }
}
