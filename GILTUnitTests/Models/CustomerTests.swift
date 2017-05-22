//
//  CustomerTests.swift
//  GILT
//
//  Created by Alessandro dos Santos Pinto on 18/05/2017.
//  Copyright © 2017 Alessandro dos Santos Pinto. All rights reserved.
//

import XCTest
import Foundation

class CustomerTests: XCTestCase {
    

    func testCreateCustomers() {
        let colorOne = Color(id: 1, finish: .Matte)
        let colorTwo = Color(id: 1, finish: .Gloss)
        let colorThree = Color(id: 2, finish: .Matte)
        
        let customer = Customer(colors: [colorOne, colorTwo, colorThree])
        
        XCTAssertNotNil(customer)
        XCTAssertNotNil(customer.colors[0])
        XCTAssertNotNil(customer.colors[1])
        XCTAssertNotNil(customer.colors[2])
        
        XCTAssertEqual(customer.colors[0].id, Int(1))
        XCTAssertEqual(customer.colors[1].id, Int(1))
        XCTAssertEqual(customer.colors[2].id, Int(2))
        
        XCTAssertNotEqual(customer.colors[0].id, Int(2))
        XCTAssertNotEqual(customer.colors[1].id, Int(2))
        XCTAssertNotEqual(customer.colors[2].id, Int(1))
        
    }
    
    func testCreateCustomerWithFixture1() {
        let mock = MockProvider()
        let file = mock.getMock(withName: "fixture1", type: "txt")
        guard let fileString = file else {
            XCTAssertThrowsError("Could not locate file")
            return
        }
        
        guard let paintShop = Paintshop(string: fileString) else {
            XCTFail()
            return
        }
        
        let customers = paintShop.customers
        
        XCTAssertNotNil(customers)
        XCTAssertEqual(customers.count, 3)
        XCTAssertEqual(customers[0].colors.count, 3)
        XCTAssertEqual(customers[1].colors.count, 3)
        XCTAssertEqual(customers[2].colors.count, 1)
    }
    
}
