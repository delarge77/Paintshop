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
        var results = Dictionary<Int, Color.Finish>()
        let sortedCustomers = paintshop.customers.sorted { $0.colors.count < $1.colors.count }
        
        for customer in sortedCustomers {
            var candidates = [Color]()
            let color = determine(&candidates, customer: customer, results: results)
                
            if customer.colors.count == 1 {
                guard let color = color else {
                    return "No solution exists."
                }
                results[color.id] = color.finish
            } else {
                if let _ = color {
                    continue
                } else if candidates.count == 0 {
                    return "No solution exists."
                }
                
                var result = candidates.first
                for color in candidates {
                    if color.finish == .Gloss {
                        result = color
                    }
                }
                
                if let result = result {
                    results[result.id] = result.finish
                }
            }
        }
        
        return output(results: results)
    }
    
    private func determine(_ colors: inout [Color], customer: Customer, results: [Int: Color.Finish]) -> Color? {
        for color in customer.colors {
            let finish = results[color.id]
            
            if customer.colors.count == 1 {
                if finish == nil || finish == color.finish {
                    return color
                } else {
                    return nil
                }
            } else {
                if finish == nil {
                    colors.append(color)
                } else if finish == color.finish {
                    return color
                }
            }
        }
        
        return nil
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
