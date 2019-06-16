//
//  ArrayUtilsTests.swift
//  RoasterHammerTests
//
//  Created by Thibault Klein on 4/22/19.
//  Copyright © 2019 Thibault Klein. All rights reserved.
//

import XCTest
@testable import RoasterHammer

class ArrayUtilsTests: XCTestCase {

    func testArrayCommonElements() {
        // Given
        let array1 = ["Apple", "Orange", "Banana", "Kiwi"]
        let array2 = ["Kiwi", "Orange"]
        let expectedResult = ["Orange", "Kiwi"]
        // When
        let result = array1.commonElements(in: array2)
        // Then
        XCTAssertEqual(expectedResult, result)
    }

}
