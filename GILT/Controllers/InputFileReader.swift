//
//  Input.swift
//  GILT
//
//  Created by Alessandro dos Santos Pinto on 17/05/2017.
//  Copyright © 2017 Alessandro dos Santos Pinto. All rights reserved.
//

import Foundation

struct InputFileReader {
    func readFileAt(_ path: String) -> String? {
        let manager = FileManager.default
        if manager.fileExists(atPath: path) {
            guard let content = try? String(contentsOfFile: path) else {
                print("Error reading file contents.")
                return nil
            }
            return content
        } else {
            print("Specified file doesn't exist.")
            return nil
        }
    }
}
