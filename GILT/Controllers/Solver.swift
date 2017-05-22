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
        var solution: [Int: Color.Finish] = [:]
        let sortedCustomers = paintshop.customers.sorted { $0.colors.count < $1.colors.count }
        
        for customer in sortedCustomers {
            guard let color = candidateFor(customer, solution: solution) else {
                if customer.satisfied(with: solution) {
                    continue
                } else {
                    return "No solution exists."
                }
            }
            
            solution[color.id] = color.finish
        }
        
        return complete(solution)
    }
    
    private func candidateFor(_ customer: Customer, solution: [Int: Color.Finish]) -> Color? {
        if customer.colors.count == 1 {
            guard let color = customer.colors.first else {
                return nil
            }
            
            if let finish = solution[color.id], finish != color.finish {
                return nil
            } else {
                return color
            }
        } else {
            if customer.colors.filter({ solution[$0.id] == $0.finish }).count > 0 {
                return nil
            }
            
            let colors = customer.colors.filter { solution[$0.id] == nil }
            return colors.filter { $0.finish == .Gloss }.first ?? colors.first
        }
    }
    
    private func complete(_ solution: [Int: Color.Finish]) -> String {
        let output = (1...paintshop.numberOfColors).map { solution[$0] ?? .Gloss }
        return output.map { $0.rawValue }.joined(separator: " ")
    }
}
