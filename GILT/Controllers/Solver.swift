//
//  Solver.swift
//  GILT
//
//  Created by Alessandro dos Santos Pinto on 17/05/2017.
//  Copyright © 2017 Alessandro dos Santos Pinto. All rights reserved.
//

import Foundation

struct Solver {
    let paintshop: Paintshop
    
    func solve() -> String {
        var results: [Int: Color.Finish] = [:]
        let sortedCustomers = paintshop.customers.sorted { $0.colors.count < $1.colors.count }
        
        for customer in sortedCustomers {
            guard let color = candidateForCustomer(customer, results: results) else {
                if customer.satisfiedBy(results) {
                    continue
                } else {
                    return "No solution exists."
                }
            }
            
            results[color.id] = color.finish
        }
        
        return output(results: results)
    }
    
    // Returns the user's color option if it isn't in the results yet
    // If the user is not satisfied, it returns `nil` meaning no solution exists
    // Obs. This method should be used only for single option users
    
    private func candidateForCustomer(_ customer: Customer, results: [Int: Color.Finish]) -> Color? {
        if customer.colors.count == 1 {
            guard let color = customer.colors.first else {
                return nil
            }
            
            if let finish = results[color.id], finish != color.finish {
                return nil
            } else {
                return color
            }
        } else {
            var colors: [Color] = []
            for color in customer.colors {
                if let finish = results[color.id] {
                    if finish == color.finish {
                        return nil
                    }
                } else {
                    colors.append(color)
                }
            }
            
            // Try to find a gloss option, otherwise use matte
            var result = colors.first
            for color in colors {
                if color.finish == .Gloss {
                    result = color
                    break
                }
            }
            
            return result
        }
    }
    
    private func output(results: [Int: Color.Finish]) -> String {
        var output: [Color.Finish] = []
        for id in 1..<(paintshop.numberOfColors + 1) {
            if let finish = results[id] {
                output.append(finish)
            } else {
                output.append(.Gloss)
            }
        }
        
        return output.map { $0.rawValue }.joined(separator: " ")
    }
}
