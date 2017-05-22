//
//  Customer.swift
//  GILT
//
//  Created by Alessandro dos Santos Pinto on 17/05/2017.
//  Copyright © 2017 Alessandro dos Santos Pinto. All rights reserved.
//

import Foundation

struct Customer {
    let options: [Paint]
}

extension Customer {
    init(string: String) throws {
        var options = [Paint]()
        let items = string.trimmingCharacters(in: .whitespaces).components(separatedBy: .whitespaces)
        
        for index in stride(from: 0, to: items.count, by: 2) {
            guard index < items.count, let color = Int(items[index]) else {
                throw CustomerError.ColorNotSpecified
            }
            
            guard (index + 1) < items.count, let finish = Finish(rawValue: items[index + 1]) else {
                throw CustomerError.FinishNotSpecified
            }
            
            let paint = Paint(color: color, finish: finish)
            options.append(paint)
        }
        
        self.options = options
    }
    
    func satisfied(with solution: [Color: Finish]) -> Bool {
        for paint in options {
            if solution[paint.color] == paint.finish {
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
