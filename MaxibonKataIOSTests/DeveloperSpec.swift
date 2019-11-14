//
//  DeveloperSpec.swift
//  MaxibonKataIOS
//
//  Created by Pedro Vicente Gomez on 29/06/16.
//  Copyright © 2016 GoKarumi. All rights reserved.
//

import Foundation
import XCTest
import SwiftCheck
@testable import MaxibonKataIOS

class DeveloperSpec: XCTestCase {

    fileprivate let anyName = "Pedro"
    fileprivate let anyNumberOfMaxibonsToGet = 11

    func testTheNumberOfMaxibonsPerKarumieAre() {
        XCTAssertEqual(3, Karumies.Pedro.numberOfMaxibonsToGet)
        XCTAssertEqual(0, Karumies.Davide.numberOfMaxibonsToGet)
        XCTAssertEqual(1, Karumies.Toni.numberOfMaxibonsToGet)
        XCTAssertEqual(2, Karumies.Jorge.numberOfMaxibonsToGet)
        XCTAssertEqual(1, Karumies.Sergio.numberOfMaxibonsToGet)
        XCTAssertEqual(1, Karumies.Fran.numberOfMaxibonsToGet)
    }

    func testAll() {
        
        property("maxibons should be zero or more") <- forAll { (name: String, maxibons: Int) in
            let dev = Developer(name: name, numberOfMaxibonsToGet: maxibons)
            return dev.numberOfMaxibonsToGet >= 0
        }
    }

}
