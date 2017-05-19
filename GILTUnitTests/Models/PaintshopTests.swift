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
    var paint: String? = nil
    
    override func setUp() {
        super.setUp()
     
        paint = mock.getMock(withName: "fixture1", type: "txt")
    }

    func testPaintShopWithFixture1() {
        
        guard let paint = paint else {
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
}
