//
//  Paintshop.swift
//  GILT
//
//  Created by Alessandro dos Santos Pinto on 17/05/2017.
//  Copyright © 2017 Alessandro dos Santos Pinto. All rights reserved.
//

import Foundation

struct Paintshop {
    let numberOfColors: Int
    let customers: [Customer]
}

extension Paintshop {
    init?(string: String) {
        var customers = [Customer]()
        var lines = string.components(separatedBy: "\n").filter { !$0.isEmpty }
        
        guard let numberOfColors = Int(lines.remove(at: 0)) else {
            return nil
        }
        
        for line in lines {
            guard let customer = Customer(string: line) else {
                return nil
            }
            
            customers.append(customer)
        }
        
        self.numberOfColors = numberOfColors
        self.customers = customers
    }
}
