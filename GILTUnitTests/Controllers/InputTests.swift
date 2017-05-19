//
//  InputTests.swift
//  GILT
//
//  Created by Alessandro dos Santos Pinto on 18/05/2017.
//  Copyright © 2017 Alessandro dos Santos Pinto. All rights reserved.
//

import XCTest

class InputTests: XCTestCase {

    func testInputFile() {
        let file = Bundle(for: type(of: self)).path(forResource: "fixture1", ofType: "txt")
        
        guard let filePath = file else {
            return
        }
        
        let inputOne = Input(path: filePath)
        let output = inputOne.read()
        
        ///////////
        
        let fileError = Bundle(for: type(of: self)).path(forResource: "invalid", ofType: "txt")
        
        guard let filePathError = fileError else {
            return
        }
        
        let inputError = Input(path: filePathError)
        let error = inputError.read()
        
        ///////////
        
        let input = Input(path: "")
        let output1 = input.read()
        
        
    }

}
