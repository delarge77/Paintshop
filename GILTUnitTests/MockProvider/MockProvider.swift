//
//  MockProvider.swift
//  GILT
//
//  Created by Alessandro dos Santos Pinto on 18/05/2017.
//  Copyright © 2017 Alessandro dos Santos Pinto. All rights reserved.
//

import Foundation
import XCTest

class MockProvider: XCTestCase {
        
    func getMock(withName fileName:String, type: String) -> String? {
        
        guard let pathFromResource = Bundle(for: type(of: self)).path(forResource: fileName, ofType: type) else {
            XCTAssertThrowsError("Could not locate file")
            return nil
        }
        
        let contents = try? String(contentsOfFile: pathFromResource, encoding: String.Encoding.utf8)
        
        guard let contentsOfFile = contents else {
            XCTAssertThrowsError("Could not load file")
            return nil
        }
        
        return contentsOfFile.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
    }
    
}
