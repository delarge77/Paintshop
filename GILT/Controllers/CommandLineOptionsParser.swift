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
    
    func inputFilePath() throws -> String {
        guard arguments.count > 1 else {
            throw CommandLineOptionsParserError.NoInputFileProvided
        }
        
        return arguments[1]
    }
}

enum CommandLineOptionsParserError: Error {
    case NoInputFileProvided
}
