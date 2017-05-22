//
//  Customer.swift
//  GILT
//
//  Created by Alessandro dos Santos Pinto on 17/05/2017.
//  Copyright © 2017 Alessandro dos Santos Pinto. All rights reserved.
//

import Foundation

struct Customer {
    let colors: [Color]
}

extension Customer {
    init(string: String) throws {
        var colors = [Color]()
        let items = string.components(separatedBy: " ")
        
        for index in stride(from: 0, to: items.count, by: 2) {
            guard index < items.count, let id = Int(items[index]) else {
                throw CustomerError.ColorNotSpecified
            }
            
            guard (index + 1) < items.count, let finish = Color.Finish(rawValue: items[index + 1]) else {
                throw CustomerError.FinishNotSpecified
            }
            
            let color = Color(id: id, finish: finish)
            colors.append(color)
        }
        
        self.colors = colors
    }
    
    func satisfiedWith(_ solution: [Int: Color.Finish]) -> Bool {
        for color in colors {
            if solution[color.id] == color.finish {
                return true
            }
        }
        
        return false
    }
}

enum CustomerError: Error {
    case ColorNotSpecified
    case FinishNotSpecified
}
