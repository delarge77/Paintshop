//
//  CommandLineOptionsParserTests.swift
//  GILT
//
//  Created by Alessandro dos Santos Pinto on 18/05/2017.
//  Copyright © 2017 Alessandro dos Santos Pinto. All rights reserved.
//

import XCTest

class CommandLineOptionsParserTests: XCTestCase {
    func testValidInputFilePath() {
        let parser = CommandLineOptionsParser(arguments: ["dir", "~/test.txt"])
        let path = try? parser.inputFilePath()
        XCTAssertEqual(path, "~/test.txt")
    }
    
    func testInvalidInputFilePath() {
        let parser = CommandLineOptionsParser(arguments: ["dir"])
        
        var path: String?
        XCTAssertThrowsError(path = try parser.inputFilePath()) { error in
            XCTAssertEqual(error as? CommandLineOptionsParserError, .NoInputFileProvided)
            XCTAssertNil(path)
        }
    }
}
