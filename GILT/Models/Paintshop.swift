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
    init(string: String) throws {
        var lines = string.components(separatedBy: "\n").filter { !$0.isEmpty }
        
        guard lines.count > 1 else {
            throw PaintshopError.InvalidFileFormat
        }
        
        guard let numberOfColors = Int(lines.remove(at: 0)) else {
            throw PaintshopError.NumberOfColorsNotProvided
        }
        
        let customers = try lines.map { try Customer(string: $0) }
        
        let actualNumberOfColors = customers.reduce(0) { (result, customer) in
            return customer.colors.reduce(result) { (_, color) in
                if color.id > result {
                    return color.id
                } else {
                    return result
                }
            }
        }
        
        guard actualNumberOfColors == numberOfColors else {
            throw PaintshopError.InvalidNumberOfColors
        }
        
        self.numberOfColors = numberOfColors
        self.customers = customers
    }
}

enum PaintshopError: Error {
    case NumberOfColorsNotProvided
    case InvalidNumberOfColors
    case InvalidFileFormat
}
