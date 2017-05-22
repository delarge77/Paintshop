//
//  InputFileReader.swift
//  GILT
//
//  Created by Alessandro dos Santos Pinto on 17/05/2017.
//  Copyright © 2017 Alessandro dos Santos Pinto. All rights reserved.
//

import Foundation

struct InputFileReader {
    func readFileAt(_ path: String) throws -> String {
        let manager = FileManager.default
        if manager.fileExists(atPath: path) {
            guard let content = try? String(contentsOfFile: path) else {
                throw InputFileReaderError.InputFileWithError
            }
            return content
        } else {
            throw InputFileReaderError.InputFileNotFound
        }
    }
}

enum InputFileReaderError: Error {
    case InputFileNotFound
    case InvalidFileFormat
}
