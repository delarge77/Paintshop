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
    init?(string: String) {
        var colors = [Color]()
        let items = string.components(separatedBy: " ")
        
        for index in stride(from: 0, to: items.count, by: 2) {
            guard let id = Int(items[index]) else {
                return nil
            }
            
            guard let finish = Color.Finish(rawValue: items[index + 1]) else {
                return nil
            }
            
            let color = Color(id: id, finish: finish)
            colors.append(color)
        }
        
        self.colors = colors
    }
}
