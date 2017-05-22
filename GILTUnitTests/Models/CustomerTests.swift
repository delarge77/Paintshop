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
        
        XCTAssertEqual(customer.colors[0].id, 1)
        XCTAssertEqual(customer.colors[1].id, 1)
        XCTAssertEqual(customer.colors[2].id, 2)
        
        XCTAssertNotEqual(customer.colors[0].id, 2)
        XCTAssertNotEqual(customer.colors[1].id, 2)
        XCTAssertNotEqual(customer.colors[2].id, 1)
        
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
    
    func testCustomerWithFinishNotSpecified() {
        let file = "1"
        
        var customer: Customer?
        
        XCTAssertThrowsError(customer = try Customer(string: file)) { error in
            XCTAssertNil(customer)
            XCTAssertEqual(error as? CustomerError, .FinishNotSpecified)
        }
    }
    
}
