//
//  GILTUnitTests.swift
//  GILTUnitTests
//
//  Created by Alessandro dos Santos Pinto on 18/05/2017.
//  Copyright © 2017 Alessandro dos Santos Pinto. All rights reserved.
//

import XCTest

class PaintTests: XCTestCase {
    
    func testColors() {
        let colorGloss = Paint(color: 1, finish: .Gloss)
        let colorMatte = Paint(color: 1, finish: .Matte)
        
        
        XCTAssertNotNil(colorGloss)
        XCTAssertNotNil(colorMatte)
        
        XCTAssertEqual(colorGloss.color, 1)
        XCTAssertEqual(colorMatte.color, 1)
        
        XCTAssertEqual(colorGloss.finish, .Gloss)
        XCTAssertEqual(colorMatte.finish, .Matte)
    }
}
