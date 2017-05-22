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
    let content = try reader.readFileAt(path)
    let shop = try Paintshop(string: content)
    var solver = Solver(paintshop: shop)
    let result = solver.solve()
    print("\(result)")
} catch CommandLineOptionsParserError.NoInputFileProvided {
    print("No input file provided")
} catch InputFileReaderError.InvalidFileFormat {
    print("Invalid file format")
} catch InputFileReaderError.InputFileNotFound {
    print("File not found")
} catch PaintshopError.NumberOfColorsNotProvided {
    print("Number of colors not provided")
} catch PaintshopError.InvalidNumberOfColors {
    print("Invalid number of colors")
} catch PaintshopError.InvalidFileFormat {
    print("Invalid file format")
} catch CustomerError.ColorNotSpecified {
    print("Color Not Specified")
} catch CustomerError.FinishNotSpecified {
    print("Finish Not Specified")
}
