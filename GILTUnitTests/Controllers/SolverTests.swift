//
//  SolverTests.swift
//  GILT
//
//  Created by Alessandro dos Santos Pinto on 18/05/2017.
//  Copyright © 2017 Alessandro dos Santos Pinto. All rights reserved.
//

import XCTest

class SolverTests: XCTestCase {
    
    func testFixture1() {
        verifyFixtureNamed("fixture1", expectedResult: "G G G G M")
    }
    
    func testFixture2() {
        verifyFixtureNamed("fixture2", expectedResult: "No solution exists.")
    }
    
    func testFixture3() {
        verifyFixtureNamed("fixture3", expectedResult: "G M G M G")
    }
    
    func testFixture4() {
        verifyFixtureNamed("fixture4", expectedResult: "M M")
    }
    
    func testFixture5() {
        verifyFixtureNamed("fixture5", expectedResult: "No solution exists.")
    }

    func verifyFixtureNamed(_ name: String, expectedResult: String) {
        let mock = MockProvider()
        guard let fixture = mock.getMock(withName: name, type: "txt") else {
            XCTFail()
            return
        }
        
        guard let paintShop = try? Paintshop(string: fixture) else {
            XCTFail()
            return
        }
        
        let solver = Solver(paintshop: paintShop)
        
        let result = solver.solve()
        
        XCTAssertEqual(result, expectedResult)
    }
}
