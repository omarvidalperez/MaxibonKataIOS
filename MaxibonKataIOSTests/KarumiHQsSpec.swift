//
//  KarumiHQsSpec.swift
//  MaxibonKataIOS
//
//  Created by Pedro Vicente Gomez on 29/06/16.
//  Copyright © 2016 GoKarumi. All rights reserved.
//

import Foundation
import XCTest
import SwiftCheck
@testable import MaxibonKataIOS

class KarumiHQsSpec: XCTestCase {

    func testKarumiHQsStartsTheWeekWithTenMaxibons() {
        XCTAssertEqual(10, KarumiHQs().maxibonsLeft)
    }

    func testAll() {
        
        property("identity") <- forAll { (value: String) in
            print(value)
            return value + "" == value
        }
        
        property("two consecutive strings hace the same size") <- forAll { (value: String, value2: String) in
            return (value + value2).count == (value2 + value).count
        }
        
        property("reverse twice gets the same value") <- forAll { (value: String) in
            return value == value.reversed().reversed()
        }

    }

    fileprivate func calculateMaxibonsLeft(_ initialMaxibons: Int, developers: [Developer]) -> Int {
        var maxibonsLeft = initialMaxibons
        developers.forEach { developer in
            maxibonsLeft -= developer.numberOfMaxibonsToGet
            if maxibonsLeft < 0 {
                maxibonsLeft = 0
            }
            if maxibonsLeft <= 2 {
                maxibonsLeft += 10
            }
        }
        return maxibonsLeft
    }

    fileprivate func maxibonsAfterOpeningTheFridge(_ initialMaxibons: Int, _ maxibonsToGet: Int) -> Int {
        var expectedMaxibons = initialMaxibons - maxibonsToGet
        if expectedMaxibons < 0 {
            expectedMaxibons = 0
        }
        expectedMaxibons += 10
        return expectedMaxibons
    }

}
