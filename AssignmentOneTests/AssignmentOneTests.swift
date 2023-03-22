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

    // Check if a newly created list item has the expected data for its attributes
    func testListItem() throws {
        var description = "This is a test description"
        var checked = false
        
        let item = ListItem(description: description, checked: checked)
        
        XCTAssertEqual(item.description, description)
        XCTAssertEqual(item.checked, checked)
    }
    
    // Check if the generated example list contains the expected number of items
    func testExampleListCount() throws {
        let list = ListItem.generateExampleList()
        
        XCTAssertEqual(list.count, 10)
    }
    
    // Check if the checked state of the items in the example list is as expected
    func testExampleListCheckedStates() throws {
        let list = ListItem.generateExampleList()
        let expectedCheckedStates = [true, false, true, false, true, false, true, false, true, false]
        
        for (index, item) in list.enumerated() {
            XCTAssertEqual(item.checked, expectedCheckedStates[index])
        }
    }
    
    // Check if the generated example list is returning a valid list with no nil data
    func testExampleListItems() throws {
        let list = ListItem.generateExampleList()
        
        for item in list {
            XCTAssertNotNil(item)
            XCTAssertNotNil(item.id)
            XCTAssertNotNil(item.description)
            XCTAssertNotNil(item.checked)
        }
    }

    // Check if the first and last items in the list have their description value as expected
    func testExampleListDescriptions() throws {
        let list = ListItem.generateExampleList()
        
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
