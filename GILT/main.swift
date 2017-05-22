//
//  main.swift
//  GILT
//
//  Created by Alessandro dos Santos Pinto on 17/05/2017.
//  Copyright © 2017 Alessandro dos Santos Pinto. All rights reserved.
//

import Foundation

let options = CommandLineOptionsParser()

do {
    
    let path = try options.inputFilePath()
    let reader = InputFileReader()
    if let content = reader.readFileAt(path) {
        if let shop = Paintshop(string: content) {
            var solver = Solver(paintshop: shop)
            let result = solver.solve()
            print("\(result)")
        } else {
            print("Error parsing input file.")
        }
    }
} catch CommandLineOptionsParserError.NoInputFileProvided {
    print("No input file provided")
}
