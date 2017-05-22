//
//  InputFileReaderTests.swift
//  GILT
//
//  Created by Alessandro dos Santos Pinto on 18/05/2017.
//  Copyright © 2017 Alessandro dos Santos Pinto. All rights reserved.
//

import XCTest

class InputFileReaderTests: XCTestCase {

    func testInputFile() {
        let reader = InputFileReader()
        guard let path = Bundle(for: type(of: self)).path(forResource: "reader-input", ofType: "txt") else {
            XCTFail()
            return
        }
        let output = try? reader.readFileAt(path)
        XCTAssertEqual(output, "GILT\n")
    }
    
    func testInvalidFileFormat() {
        
        guard let path = Bundle(for: type(of: self)).path(forResource: "gilt", ofType: "jpg") else {
            XCTFail()
            return
        }
        
        let reader = InputFileReader()
        
        var content: String?
        XCTAssertThrowsError(content = try reader.readFileAt(path)) { error in
            XCTAssertEqual(error as? InputFileReaderError, .InvalidFileFormat)
            XCTAssertNil(content)
        }
    }
    
    func testInputFileNotFound () {
        let reader = InputFileReader()
        
        var content: String?
        XCTAssertThrowsError(content = try reader.readFileAt("filenotexist.txt")) { error in
            XCTAssertEqual(error as? InputFileReaderError, .InputFileNotFound)
            XCTAssertNil(content)
        }
    }
}
