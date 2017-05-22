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
        guard let paintShop = Paintshop(string: paint) else {
            XCTFail()
            return
        }
        
        XCTAssertEqual(paintShop.customers.count, 3)
        XCTAssertEqual(paintShop.numberOfColors, 5)
        XCTAssertEqual(paintShop.customers[0].colors.count, 3)
        XCTAssertEqual(paintShop.customers[1].colors.count, 3)
        XCTAssertEqual(paintShop.customers[2].colors.count, 1)
        XCTAssertEqual(paintShop.customers[0].colors[0].id, 1)
        XCTAssertEqual(paintShop.customers[0].colors[1].id, 3)
        XCTAssertEqual(paintShop.customers[0].colors[2].id, 5)
        XCTAssertEqual(paintShop.customers[1].colors[0].id, 2)
        XCTAssertEqual(paintShop.customers[1].colors[1].id, 3)
        XCTAssertEqual(paintShop.customers[1].colors[2].id, 4)
        XCTAssertEqual(paintShop.customers[2].colors[0].id, 5)
        XCTAssertNotEqual(paintShop.customers[0].colors[0].finish, .Gloss)
        XCTAssertNotEqual(paintShop.customers[0].colors[1].finish, .Matte)
        XCTAssertNotEqual(paintShop.customers[0].colors[2].finish, .Matte)
    }
    
    func testPaintShopWithFixture2() {
        
        guard let paint = mock.getMock(withName: "fixture2", type: "txt") else {
            XCTAssertThrowsError("Could not locate file")
            return
        }
        guard let paintShop = Paintshop(string: paint) else {
            XCTFail()
            return
        }
        
        XCTAssertEqual(paintShop.customers.count, 2)
        XCTAssertEqual(paintShop.numberOfColors, 1)
        XCTAssertEqual(paintShop.customers[0].colors.count, 1)
        XCTAssertEqual(paintShop.customers[1].colors.count, 1)
        XCTAssertEqual(paintShop.customers[0].colors[0].id, 1)
        XCTAssertEqual(paintShop.customers[1].colors[0].id, 1)
        XCTAssertNotEqual(paintShop.customers[0].colors[0].finish, .Matte)
        XCTAssertNotEqual(paintShop.customers[1].colors[0].finish, .Gloss)
        XCTAssertEqual(paintShop.customers[0].colors[0].finish, .Gloss)
        XCTAssertEqual(paintShop.customers[1].colors[0].finish, .Matte)
    }
    
    func testPaintShopWithFixture3() {
        
        guard let paint = mock.getMock(withName: "fixture3", type: "txt") else {
            XCTAssertThrowsError("Could not locate file")
            return
        }
        guard let paintShop = Paintshop(string: paint) else {
            XCTFail()
            return
        }
        
        XCTAssertEqual(paintShop.customers.count, 14)
        XCTAssertEqual(paintShop.numberOfColors, 5)
        XCTAssertEqual(paintShop.customers[0].colors.count, 1)
        XCTAssertEqual(paintShop.customers[1].colors.count, 1)
        XCTAssertEqual(paintShop.customers[2].colors.count, 1)
        XCTAssertEqual(paintShop.customers[3].colors.count, 3)
        XCTAssertEqual(paintShop.customers[4].colors.count, 1)
        XCTAssertEqual(paintShop.customers[5].colors.count, 1)
        XCTAssertEqual(paintShop.customers[6].colors.count, 3)
        XCTAssertEqual(paintShop.customers[7].colors.count, 1)
        XCTAssertEqual(paintShop.customers[8].colors.count, 1)
        XCTAssertEqual(paintShop.customers[9].colors.count, 2)
        XCTAssertEqual(paintShop.customers[10].colors.count, 1)
        XCTAssertEqual(paintShop.customers[11].colors.count, 1)
        XCTAssertEqual(paintShop.customers[12].colors.count, 1)
        XCTAssertEqual(paintShop.customers[13].colors.count, 2)
        XCTAssertEqual(paintShop.customers[0].colors[0].id, 2)
        XCTAssertEqual(paintShop.customers[0].colors[0].finish, .Matte)
        XCTAssertEqual(paintShop.customers[1].colors[0].id, 5)
        XCTAssertEqual(paintShop.customers[1].colors[0].finish, .Gloss)
        XCTAssertEqual(paintShop.customers[2].colors[0].id, 1)
        XCTAssertEqual(paintShop.customers[2].colors[0].finish, .Gloss)
        XCTAssertEqual(paintShop.customers[3].colors[0].id, 5)
        XCTAssertEqual(paintShop.customers[3].colors[0].finish, .Gloss)
        XCTAssertEqual(paintShop.customers[3].colors[1].id, 1)
        XCTAssertEqual(paintShop.customers[3].colors[1].finish, .Gloss)
        XCTAssertEqual(paintShop.customers[3].colors[2].id, 4)
        XCTAssertEqual(paintShop.customers[3].colors[2].finish, .Matte)
        XCTAssertEqual(paintShop.customers[4].colors[0].id, 3)
        XCTAssertEqual(paintShop.customers[4].colors[0].finish, .Gloss)
        XCTAssertEqual(paintShop.customers[5].colors[0].id, 5)
        XCTAssertEqual(paintShop.customers[5].colors[0].finish, .Gloss)
        XCTAssertEqual(paintShop.customers[6].colors[0].id, 3)
        XCTAssertEqual(paintShop.customers[6].colors[0].finish, .Gloss)
        XCTAssertEqual(paintShop.customers[6].colors[1].id, 5)
        XCTAssertEqual(paintShop.customers[6].colors[1].finish, .Gloss)
        XCTAssertEqual(paintShop.customers[6].colors[2].id, 1)
        XCTAssertEqual(paintShop.customers[6].colors[2].finish, .Gloss)
        XCTAssertEqual(paintShop.customers[7].colors[0].id, 3)
        XCTAssertEqual(paintShop.customers[7].colors[0].finish, .Gloss)
        XCTAssertEqual(paintShop.customers[8].colors[0].id, 2)
        XCTAssertEqual(paintShop.customers[8].colors[0].finish, .Matte)
        XCTAssertEqual(paintShop.customers[9].colors[0].id, 5)
        XCTAssertEqual(paintShop.customers[9].colors[0].finish, .Gloss)
        XCTAssertEqual(paintShop.customers[9].colors[1].id, 1)
        XCTAssertEqual(paintShop.customers[9].colors[1].finish, .Gloss)
        XCTAssertEqual(paintShop.customers[10].colors[0].id, 2)
        XCTAssertEqual(paintShop.customers[10].colors[0].finish, .Matte)
        XCTAssertEqual(paintShop.customers[11].colors[0].id, 5)
        XCTAssertEqual(paintShop.customers[11].colors[0].finish, .Gloss)
        XCTAssertEqual(paintShop.customers[12].colors[0].id, 4)
        XCTAssertEqual(paintShop.customers[12].colors[0].finish, .Matte)
        XCTAssertEqual(paintShop.customers[13].colors[0].id, 5)
        XCTAssertEqual(paintShop.customers[13].colors[0].finish, .Gloss)
        XCTAssertEqual(paintShop.customers[13].colors[1].id, 4)
        XCTAssertEqual(paintShop.customers[13].colors[1].finish, .Matte)
    }
    
    func testPaintShopWithFixture4() {
        
        guard let paint = mock.getMock(withName: "fixture4", type: "txt") else {
            XCTAssertThrowsError("Could not locate file")
            return
        }
        guard let paintShop = Paintshop(string: paint) else {
            XCTFail()
            return
        }
        
        XCTAssertEqual(paintShop.customers.count, 2)
        XCTAssertEqual(paintShop.numberOfColors, 2)
        XCTAssertEqual(paintShop.customers[0].colors.count, 2)
        XCTAssertEqual(paintShop.customers[1].colors.count, 1)
        XCTAssertEqual(paintShop.customers[0].colors[0].id, 1)
        XCTAssertEqual(paintShop.customers[0].colors[0].finish, .Gloss)
        XCTAssertEqual(paintShop.customers[0].colors[1].id, 2)
        XCTAssertEqual(paintShop.customers[0].colors[1].finish, .Matte)
        XCTAssertEqual(paintShop.customers[1].colors[0].id, 1)
        XCTAssertEqual(paintShop.customers[1].colors[0].finish, .Matte)
    }
    
    func testPaintShopWithFixture5() {
        
        guard let paint = mock.getMock(withName: "fixture5", type: "txt") else {
            XCTAssertThrowsError("Could not locate file")
            return
        }
        guard let paintShop = Paintshop(string: paint) else {
            XCTFail()
            return
        }
        
        XCTAssertEqual(paintShop.customers.count, 3)
        XCTAssertEqual(paintShop.numberOfColors, 2)
        XCTAssertEqual(paintShop.customers[0].colors.count, 1)
        XCTAssertEqual(paintShop.customers[1].colors.count, 1)
        XCTAssertEqual(paintShop.customers[2].colors.count, 2)
        XCTAssertEqual(paintShop.customers[0].colors[0].id, 1)
        XCTAssertEqual(paintShop.customers[0].colors[0].finish, .Matte)
        XCTAssertEqual(paintShop.customers[1].colors[0].id, 2)
        XCTAssertEqual(paintShop.customers[1].colors[0].finish, .Matte)
        XCTAssertEqual(paintShop.customers[2].colors[0].id, 1)
        XCTAssertEqual(paintShop.customers[2].colors[0].finish, .Gloss)
        XCTAssertEqual(paintShop.customers[2].colors[1].id, 2)
        XCTAssertEqual(paintShop.customers[2].colors[1].finish, .Gloss)

    }
    
    func testPaintShopWithFixtureInvalid() {
        
        guard let paint = mock.getMock(withName: "invalid", type: "txt") else {
            XCTAssertThrowsError("Could not locate file")
            return
        }
        
        let paintShop = Paintshop(string: paint)
        XCTAssertNil(paintShop)
    }
}
