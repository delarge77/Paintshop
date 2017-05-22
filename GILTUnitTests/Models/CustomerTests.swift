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
        let colorOne = Paint(color: 1, finish: .Matte)
        let colorTwo = Paint(color: 1, finish: .Gloss)
        let colorThree = Paint(color: 2, finish: .Matte)
        
        let customer = Customer(options: [colorOne, colorTwo, colorThree])
        
        XCTAssertNotNil(customer)
        XCTAssertNotNil(customer.options[0])
        XCTAssertNotNil(customer.options[1])
        XCTAssertNotNil(customer.options[2])
        
        XCTAssertEqual(customer.options[0].color, 1)
        XCTAssertEqual(customer.options[1].color, 1)
        XCTAssertEqual(customer.options[2].color, 2)
        
        XCTAssertNotEqual(customer.options[0].color, 2)
        XCTAssertNotEqual(customer.options[1].color, 2)
        XCTAssertNotEqual(customer.options[2].color, 1)
        
    }
    
    func testSatisfiedCustomer() {
        guard let customer = try? Customer(string: "1 G 2 M 3 G") else {
            XCTFail()
            return
        }
        
        XCTAssertTrue(customer.satisfied(with: [1: .Gloss, 2: .Gloss, 3: .Gloss]))
    }
    
    func testUnsatisfiedCustomer() {
        guard let customer = try? Customer(string: "1 G 2 M 3 G") else {
            XCTFail()
            return
        }
        
        XCTAssertFalse(customer.satisfied(with: [1: .Matte, 2: .Gloss, 3: .Matte]))
    }
    
    func testCustomerWithColorNotSpecified() {
        let file = "M"
        
        var customer: Customer?
        
        XCTAssertThrowsError(customer = try Customer(string: file)) { error in
            XCTAssertNil(customer)
            XCTAssertEqual(error as? CustomerError, .ColorNotSpecified)
        }
    }
    
    func testCustomerWithFinishNotSpecified () {
        let file = "1"
        
        var customer: Customer?
        
        XCTAssertThrowsError(customer = try Customer(string: file)) { error in
            XCTAssertNil(customer)
            XCTAssertEqual(error as? CustomerError, .FinishNotSpecified)
        }
    }
    
}
