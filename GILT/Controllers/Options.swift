//
//  Options.swift
//  GILT
//
//  Created by Alessandro dos Santos Pinto on 17/05/2017.
//  Copyright © 2017 Alessandro dos Santos Pinto. All rights reserved.
//

import Foundation

struct Options {
    static func read() -> String? {
        guard CommandLine.argc > 1 else {
            return nil
        }
        
        return CommandLine.arguments[1]
    }
}
