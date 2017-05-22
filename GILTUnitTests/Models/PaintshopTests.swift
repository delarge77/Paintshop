//
//  PaintshopTests.swift
//  GILT
//
//  Created by Alessandro dos Santos Pinto on 18/05/2017.
//  Copyright © 2017 Alessandro dos Santos Pinto. All rights reserved.
//

import XCTest

class PaintshopTests: XCTestCase {
    
    let mock = MockProvider()
    
    override func setUp() {
        super.setUp()
    }

    func testPaintShopWithFixture1() {
        
        guard let paint = mock.getMock(withName: "fixture1", type: "txt") else {
            XCTAssertThrowsError("Could not locate file")
            return
        }
        guard let paintShop = try? Paintshop(string: paint) else {
            XCTFail()
            return
        }
        
        XCTAssertEqual(paintShop.customers.count, 3)
        XCTAssertEqual(paintShop.numberOfColors, 5)
        XCTAssertEqual(paintShop.customers[0].options.count, 3)
        XCTAssertEqual(paintShop.customers[1].options.count, 3)
        XCTAssertEqual(paintShop.customers[2].options.count, 1)
        XCTAssertEqual(paintShop.customers[0].options[0].color, 1)
        XCTAssertEqual(paintShop.customers[0].options[1].color, 3)
        XCTAssertEqual(paintShop.customers[0].options[2].color, 5)
        XCTAssertEqual(paintShop.customers[1].options[0].color, 2)
        XCTAssertEqual(paintShop.customers[1].options[1].color, 3)
        XCTAssertEqual(paintShop.customers[1].options[2].color, 4)
        XCTAssertEqual(paintShop.customers[2].options[0].color, 5)
        XCTAssertNotEqual(paintShop.customers[0].options[0].finish, .Gloss)
        XCTAssertNotEqual(paintShop.customers[0].options[1].finish, .Matte)
        XCTAssertNotEqual(paintShop.customers[0].options[2].finish, .Matte)
    }
    
    func testPaintShopWithFixture2() {
        
        guard let paint = mock.getMock(withName: "fixture2", type: "txt") else {
            XCTAssertThrowsError("Could not locate file")
            return
        }
        guard let paintShop = try? Paintshop(string: paint) else {
            XCTFail()
            return
        }
        
        XCTAssertEqual(paintShop.customers.count, 2)
        XCTAssertEqual(paintShop.numberOfColors, 1)
        XCTAssertEqual(paintShop.customers[0].options.count, 1)
        XCTAssertEqual(paintShop.customers[1].options.count, 1)
        XCTAssertEqual(paintShop.customers[0].options[0].color, 1)
        XCTAssertEqual(paintShop.customers[1].options[0].color, 1)
        XCTAssertNotEqual(paintShop.customers[0].options[0].finish, .Matte)
        XCTAssertNotEqual(paintShop.customers[1].options[0].finish, .Gloss)
        XCTAssertEqual(paintShop.customers[0].options[0].finish, .Gloss)
        XCTAssertEqual(paintShop.customers[1].options[0].finish, .Matte)
    }
    
    func testPaintShopWithFixture3() {
        
        guard let paint = mock.getMock(withName: "fixture3", type: "txt") else {
            XCTAssertThrowsError("Could not locate file")
            return
        }
        guard let paintShop = try? Paintshop(string: paint) else {
            XCTFail()
            return
        }
        
        XCTAssertEqual(paintShop.customers.count, 14)
        XCTAssertEqual(paintShop.numberOfColors, 5)
        XCTAssertEqual(paintShop.customers[0].options.count, 1)
        XCTAssertEqual(paintShop.customers[1].options.count, 1)
        XCTAssertEqual(paintShop.customers[2].options.count, 1)
        XCTAssertEqual(paintShop.customers[3].options.count, 3)
        XCTAssertEqual(paintShop.customers[4].options.count, 1)
        XCTAssertEqual(paintShop.customers[5].options.count, 1)
        XCTAssertEqual(paintShop.customers[6].options.count, 3)
        XCTAssertEqual(paintShop.customers[7].options.count, 1)
        XCTAssertEqual(paintShop.customers[8].options.count, 1)
        XCTAssertEqual(paintShop.customers[9].options.count, 2)
        XCTAssertEqual(paintShop.customers[10].options.count, 1)
        XCTAssertEqual(paintShop.customers[11].options.count, 1)
        XCTAssertEqual(paintShop.customers[12].options.count, 1)
        XCTAssertEqual(paintShop.customers[13].options.count, 2)
        XCTAssertEqual(paintShop.customers[0].options[0].color, 2)
        XCTAssertEqual(paintShop.customers[0].options[0].finish, .Matte)
        XCTAssertEqual(paintShop.customers[1].options[0].color, 5)
        XCTAssertEqual(paintShop.customers[1].options[0].finish, .Gloss)
        XCTAssertEqual(paintShop.customers[2].options[0].color, 1)
        XCTAssertEqual(paintShop.customers[2].options[0].finish, .Gloss)
        XCTAssertEqual(paintShop.customers[3].options[0].color, 5)
        XCTAssertEqual(paintShop.customers[3].options[0].finish, .Gloss)
        XCTAssertEqual(paintShop.customers[3].options[1].color, 1)
        XCTAssertEqual(paintShop.customers[3].options[1].finish, .Gloss)
        XCTAssertEqual(paintShop.customers[3].options[2].color, 4)
        XCTAssertEqual(paintShop.customers[3].options[2].finish, .Matte)
        XCTAssertEqual(paintShop.customers[4].options[0].color, 3)
        XCTAssertEqual(paintShop.customers[4].options[0].finish, .Gloss)
        XCTAssertEqual(paintShop.customers[5].options[0].color, 5)
        XCTAssertEqual(paintShop.customers[5].options[0].finish, .Gloss)
        XCTAssertEqual(paintShop.customers[6].options[0].color, 3)
        XCTAssertEqual(paintShop.customers[6].options[0].finish, .Gloss)
        XCTAssertEqual(paintShop.customers[6].options[1].color, 5)
        XCTAssertEqual(paintShop.customers[6].options[1].finish, .Gloss)
        XCTAssertEqual(paintShop.customers[6].options[2].color, 1)
        XCTAssertEqual(paintShop.customers[6].options[2].finish, .Gloss)
        XCTAssertEqual(paintShop.customers[7].options[0].color, 3)
        XCTAssertEqual(paintShop.customers[7].options[0].finish, .Gloss)
        XCTAssertEqual(paintShop.customers[8].options[0].color, 2)
        XCTAssertEqual(paintShop.customers[8].options[0].finish, .Matte)
        XCTAssertEqual(paintShop.customers[9].options[0].color, 5)
        XCTAssertEqual(paintShop.customers[9].options[0].finish, .Gloss)
        XCTAssertEqual(paintShop.customers[9].options[1].color, 1)
        XCTAssertEqual(paintShop.customers[9].options[1].finish, .Gloss)
        XCTAssertEqual(paintShop.customers[10].options[0].color, 2)
        XCTAssertEqual(paintShop.customers[10].options[0].finish, .Matte)
        XCTAssertEqual(paintShop.customers[11].options[0].color, 5)
        XCTAssertEqual(paintShop.customers[11].options[0].finish, .Gloss)
        XCTAssertEqual(paintShop.customers[12].options[0].color, 4)
        XCTAssertEqual(paintShop.customers[12].options[0].finish, .Matte)
        XCTAssertEqual(paintShop.customers[13].options[0].color, 5)
        XCTAssertEqual(paintShop.customers[13].options[0].finish, .Gloss)
        XCTAssertEqual(paintShop.customers[13].options[1].color, 4)
        XCTAssertEqual(paintShop.customers[13].options[1].finish, .Matte)
    }
    
    func testPaintShopWithFixture4() {
        
        guard let paint = mock.getMock(withName: "fixture4", type: "txt") else {
            XCTAssertThrowsError("Could not locate file")
            return
        }
        guard let paintShop = try? Paintshop(string: paint) else {
            XCTFail()
            return
        }
        
        XCTAssertEqual(paintShop.customers.count, 2)
        XCTAssertEqual(paintShop.numberOfColors, 2)
        XCTAssertEqual(paintShop.customers[0].options.count, 2)
        XCTAssertEqual(paintShop.customers[1].options.count, 1)
        XCTAssertEqual(paintShop.customers[0].options[0].color, 1)
        XCTAssertEqual(paintShop.customers[0].options[0].finish, .Gloss)
        XCTAssertEqual(paintShop.customers[0].options[1].color, 2)
        XCTAssertEqual(paintShop.customers[0].options[1].finish, .Matte)
        XCTAssertEqual(paintShop.customers[1].options[0].color, 1)
        XCTAssertEqual(paintShop.customers[1].options[0].finish, .Matte)
    }
    
    func testPaintShopWithFixture5() {
        
        guard let paint = mock.getMock(withName: "fixture5", type: "txt") else {
            XCTAssertThrowsError("Could not locate file")
            return
        }
        guard let paintShop = try? Paintshop(string: paint) else {
            XCTFail()
            return
        }
        
        XCTAssertEqual(paintShop.customers.count, 3)
        XCTAssertEqual(paintShop.numberOfColors, 2)
        XCTAssertEqual(paintShop.customers[0].options.count, 1)
        XCTAssertEqual(paintShop.customers[1].options.count, 1)
        XCTAssertEqual(paintShop.customers[2].options.count, 2)
        XCTAssertEqual(paintShop.customers[0].options[0].color, 1)
        XCTAssertEqual(paintShop.customers[0].options[0].finish, .Matte)
        XCTAssertEqual(paintShop.customers[1].options[0].color, 2)
        XCTAssertEqual(paintShop.customers[1].options[0].finish, .Matte)
        XCTAssertEqual(paintShop.customers[2].options[0].color, 1)
        XCTAssertEqual(paintShop.customers[2].options[0].finish, .Gloss)
        XCTAssertEqual(paintShop.customers[2].options[1].color, 2)
        XCTAssertEqual(paintShop.customers[2].options[1].finish, .Gloss)

    }
    
    func testPaintShopWithFixtureInvalid() {
        
        guard let paint = mock.getMock(withName: "invalid", type: "txt") else {
            XCTAssertThrowsError("Could not locate file")
            return
        }
        
        let paintShop = try? Paintshop(string: paint)
        XCTAssertNil(paintShop)
    }
    
    func testNumberOfColoursNotProvided() {
        let file = "1 M 3 G\n2 G"
        
        var paintshop: Paintshop?
        XCTAssertThrowsError(paintshop = try Paintshop(string: file)) { error in
            XCTAssertEqual(error as? PaintshopError, .NumberOfColorsNotProvided)
            XCTAssertNil(paintshop)
        }
    }
    
    func testInvalidFileFormat() {
        let file = "\n"
        
        var paintshop: Paintshop?
        XCTAssertThrowsError(paintshop = try Paintshop(string: file)) { error in
            XCTAssertEqual(error as? PaintshopError, .InvalidFileFormat)
            XCTAssertNil(paintshop)
        }
    }
    
    func testInvalidNumberOfColours() {
        let file = "1\n1 M 3 G\n2 G"
        
        var paintshop: Paintshop?
        XCTAssertThrowsError(paintshop = try Paintshop(string: file)) { error in
            XCTAssertEqual(error as? PaintshopError, .InvalidNumberOfColors)
            XCTAssertNil(paintshop)
        }
    }
}
