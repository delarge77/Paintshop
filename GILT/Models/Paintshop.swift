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

    var actualNumberOfColors: Int {
        return customers.reduce(0) { (result, customer) in
            return customer.colors.reduce(result) { (_, color) in
                if color.id > result {
                    return color.id
                } else {
                    return result
                }
            }
        }
    }
}

extension Paintshop {
    init(string: String) throws {
        var customers = [Customer]()
        var lines = string.components(separatedBy: "\n").filter { !$0.isEmpty }
        
        guard lines.count > 1 else {
            throw PaintshopError.InvalidFileFormat
        }
        
        guard let numberOfColors = Int(lines.remove(at: 0)) else {
            throw PaintshopError.NumberOfColorsNotProvided
        }
        
        for line in lines {
            do {
                let customer = try Customer(string: line)
                customers.append(customer)
            } catch let e {
                throw e
            }
        }
        
        self.numberOfColors = numberOfColors
        self.customers = customers
        
        guard actualNumberOfColors == numberOfColors else {
            throw PaintshopError.InvalidNumberOfColors
        }
    }
}

enum PaintshopError: Error {
    case NumberOfColorsNotProvided
    case InvalidNumberOfColors
    case InvalidFileFormat
}
