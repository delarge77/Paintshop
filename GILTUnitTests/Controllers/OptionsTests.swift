//
//  OptionsTests.swift
//  GILT
//
//  Created by Alessandro dos Santos Pinto on 18/05/2017.
//  Copyright © 2017 Alessandro dos Santos Pinto. All rights reserved.
//

import XCTest

class OptionsTests: XCTestCase {

    func testOption() {
        let option = Options.read()
        
        guard let opt = option else {
            return
        }
        print(opt)
    }

}
