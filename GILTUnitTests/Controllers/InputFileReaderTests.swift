//
//  InputTests.swift
//  GILT
//
//  Created by Alessandro dos Santos Pinto on 18/05/2017.
//  Copyright © 2017 Alessandro dos Santos Pinto. All rights reserved.
//

import XCTest

class InputFileReaderTests: XCTestCase {

    func testInputFile() {
        let file = Bundle(for: type(of: self)).path(forResource: "fixture1", ofType: "txt")
        
        guard let filePath = file else {
            return
        }
        
        let reader = InputFileReader()
        guard let output = reader.readFileAt(filePath) else {
            return
        }
        print(output)
        
        ///////////
        
        let fileError = Bundle(for: type(of: self)).path(forResource: "invalid", ofType: "txt")
        
        guard let filePathError = fileError else {
            return
        }
        
        guard let error = reader.readFileAt(filePathError) else {
            return
        }
        
        print(error)
        
        ///////////
        
        guard let output1 = reader.readFileAt("") else {
            return
        }
        print(output1)
    }

}
