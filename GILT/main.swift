//
//  main.swift
//  GILT
//
//  Created by Alessandro dos Santos Pinto on 17/05/2017.
//  Copyright © 2017 Alessandro dos Santos Pinto. All rights reserved.
//

import Foundation

if let path = Options.read() {
    let input = Input(path: path)
    if let content = input.read() {
        if let shop = Paintshop(string: content) {
            var solver = Solver(paintshop: shop)
            let result = solver.solve()
            print("\(result)")
        } else {
            print("Error parsing input file.")
        }
    }
}
