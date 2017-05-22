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
        var solution: [Int: Finish] = [:]
        let sortedCustomers = paintshop.customers.sorted { $0.options.count < $1.options.count }
        
        for customer in sortedCustomers {
            guard let paint = candidateFor(customer, solution: solution) else {
                if customer.satisfied(with: solution) {
                    continue
                } else {
                    return "No solution exists."
                }
            }
            
            solution[paint.color] = paint.finish
        }
        
        return complete(solution)
    }
    
    private func candidateFor(_ customer: Customer, solution: [Int: Finish]) -> Paint? {
        if customer.options.count == 1 {
            guard let paint = customer.options.first else {
                return nil
            }
            
            if let finish = solution[paint.color], finish != paint.finish {
                return nil
            } else {
                return paint
            }
        } else {
            if customer.options.filter({ solution[$0.color] == $0.finish }).count > 0 {
                return nil
            }
            
            let paints = customer.options.filter { solution[$0.color] == nil }
            return paints.filter { $0.finish == .Gloss }.first ?? paints.first
        }
    }
    
    private func complete(_ solution: [Int: Finish]) -> String {
        let output = (1...paintshop.numberOfColors).map { solution[$0] ?? .Gloss }
        return output.map { $0.rawValue }.joined(separator: " ")
    }
}
