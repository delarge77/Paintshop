//
//  PaintshopTests.swift
//  GILT
//
//  Created by Alessandro dos Santos Pinto on 18/05/2017.
//  Copyright © 2017 Alessandro dos Santos Pinto. All rights reserved.
//

import XCTest

class PaintshopTests: XCTestCase {

    func testPaintShop() {
        let mock = MockProvider()
        let paint = mock.getMock(withName: "fixture1", type: "txt")
        
        guard let paintShopSource = paint else {
            XCTAssertThrowsError("Could not locate file")
            return
        }
    
        let paintShop = Paintshop(string: paintShopSource)
        XCTAssertEqual(paintShop?.customers.count, Int(3))
        XCTAssertNotNil(paintShop)
        XCTAssertEqual(paintShop?.numberOfColors, Int(5))
        XCTAssertEqual(paintShop?.customers[0].colors.count, Int(3))
        XCTAssertEqual(paintShop?.customers[1].colors.count, Int(3))
        XCTAssertEqual(paintShop?.customers[2].colors.count, Int(1))
        XCTAssertEqual(paintShop?.customers[0].colors[0].id, Int(1))
        XCTAssertEqual(paintShop?.customers[0].colors[1].id, Int(3))
        XCTAssertEqual(paintShop?.customers[0].colors[2].id, Int(5))
        XCTAssertEqual(paintShop?.customers[1].colors[0].id, Int(2))
        XCTAssertEqual(paintShop?.customers[1].colors[1].id, Int(3))
        XCTAssertEqual(paintShop?.customers[1].colors[2].id, Int(4))
        XCTAssertEqual(paintShop?.customers[2].colors[0].id, Int(5))
        
        let matte = Color(id: 1, finish: .Matte)
        let gloss = Color(id: 1, finish: .Gloss)
        
        XCTAssertNotEqual(paintShop?.customers[0].colors[0].finish, gloss.finish)
        XCTAssertNotEqual(paintShop?.customers[0].colors[1].finish, matte.finish)
        XCTAssertNotEqual(paintShop?.customers[0].colors[2].finish, matte.finish)
    }
}
