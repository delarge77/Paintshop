//
//  Color.swift
//  GILT
//
//  Created by Alessandro dos Santos Pinto on 17/05/2017.
//  Copyright © 2017 Alessandro dos Santos Pinto. All rights reserved.
//

import Foundation

struct Color {
    let id: Int
    let finish: Finish
    
    enum Finish: String {
        case Matte = "M"
        case Gloss = "G"
    }
}
