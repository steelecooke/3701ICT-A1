//
//  AssignmentOneTests.swift
//  AssignmentOneTests
//
//  Created by Steele Cooke on 19/3/2023.
//

import XCTest
@testable import AssignmentOne

final class AssignmentOneTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    // Check that the generated example list is returning a valid list
    func testExampleList() throws {
        let list = generateExampleList()
        
        // Check that the example list doesn't contain any nil data
        for item in list {
            XCTAssertNotNil(item)
            XCTAssertNotNil(item.id)
            XCTAssertNotNil(item.description)
            XCTAssertNotNil(item.checked)
        }
        
        // Confirm that the first and last items in the example list have the correct description
        XCTAssertEqual(list[0].description, "Pay electricity bill")
        XCTAssertEqual(list[9].description, "Pay credit card bill by the end of the month")
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
