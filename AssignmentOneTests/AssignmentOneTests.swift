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
        let description = "This is a test description"
        let checked = false
        
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
    
    // Check if a newly created checklist has the expected data for its attributes
    func testCheckList() throws {
        let name = "Test Checklist"
        let items: [ListItem] = [
            ListItem(description: "Task 1", checked: true),
            ListItem(description: "Task 2", checked: false)
        ]

        let checklist = CheckList(name: name, items: items)

        XCTAssertEqual(checklist.name, name)
        XCTAssertEqual(checklist.items.description, items.description)
        XCTAssertEqual(checklist.items.count, items.count)
    }

    // Check if the generated example checklists array contains the expected number of checklists
    func testExampleCheckListsCount() throws {
        let checklists = CheckList.generateExampleCheckLists()

        XCTAssertEqual(checklists.count, 5)
    }

    // Check if the names of the checklists in the generated example checklists array are as expected
    func testExampleCheckListsNames() throws {
        let checklists = CheckList.generateExampleCheckLists()
        let expectedNames = ["First checklist!", "Second checklist!", "Third checklist!", "Fourth checklist!", "Fith checklist!"]

        for (index, checklist) in checklists.enumerated() {
            XCTAssertEqual(checklist.name, expectedNames[index])
        }
    }

    // Check if the generated example checklists array is returning valid checklists with no nil data
    func testExampleCheckListItems() throws {
        let checklists = CheckList.generateExampleCheckLists()

        for checklist in checklists {
            XCTAssertNotNil(checklist)
            XCTAssertNotNil(checklist.id)
            XCTAssertNotNil(checklist.name)
            XCTAssertNotNil(checklist.items)

            for item in checklist.items {
                XCTAssertNotNil(item)
                XCTAssertNotNil(item.id)
                XCTAssertNotNil(item.description)
                XCTAssertNotNil(item.checked)
            }
        }
    }

    // Check if the first and last checklists in the generated example checklists array have their names as expected
    func testExampleCheckListNames() throws {
        let checklists = CheckList.generateExampleCheckLists()

        XCTAssertEqual(checklists[0].name, "First checklist!")
        XCTAssertEqual(checklists[4].name, "Fith checklist!")
    }

    // Test if the initial checkLists array in CheckListCollectionViewModel is not empty
    func testInitialCheckListsNotEmpty() {
        let viewModel = CheckListCollectionViewModel()
        XCTAssertFalse(viewModel.checkLists.isEmpty)
    }

    // Test if the initial checkLists array in CheckListCollectionViewModel has the expected count
    func testInitialCheckListsCount() {
        let viewModel = CheckListCollectionViewModel()
        XCTAssertEqual(viewModel.checkLists.count, 5)
    }

    // Test removing a single checklist using removeCheckList in CheckListCollectionViewModel
    func testRemoveCheckList() {
        let viewModel = CheckListCollectionViewModel()
        let initialCount = viewModel.checkLists.count
        let indexSet = IndexSet(integer: 0)
        viewModel.removeCheckList(atOffsets: indexSet)
        
        XCTAssertEqual(viewModel.checkLists.count, initialCount - 1)
    }

    // Test adding an empty checklist using addEmptyCheckList in NewCheckListPopoverViewModel
    func testAddEmptyCheckList() {
        let viewModel = NewCheckListPopoverViewModel()
        let initialChecklists = CheckList.generateExampleCheckLists()
        let newCheckListName = "New Test Checklist"
        
        let updatedChecklists = viewModel.addEmptyCheckList(name: newCheckListName, checkLists: initialChecklists)
        
        XCTAssertEqual(updatedChecklists.count, initialChecklists.count + 1)
        XCTAssertEqual(updatedChecklists.last?.name, newCheckListName)
        XCTAssertTrue(((updatedChecklists.last?.items.isEmpty) != nil))
    }
    
    // Test if the onDelete function correctly removes the item from the list
    func testOnDelete() {
        let viewModel = CheckListViewModel()
        let items: [ListItem] = [
            ListItem(description: "Task 1", checked: true),
            ListItem(description: "Task 2", checked: false)
        ]
        let indexSet = IndexSet(integer: 0)
        let newList = viewModel.onDelete(atOffsets: indexSet, items: items)
        
        XCTAssertEqual(newList.count, 1)
        XCTAssertEqual(newList[0].description, "Task 2")
    }
    
    // Test if the onTap function creates a new ListItem and appends it to the list
    func testOnTap() {
        let viewModel = CheckListViewModel()
        let items: [ListItem] = [
            ListItem(description: "Task 1", checked: true),
            ListItem(description: "Task 2", checked: false)
        ]
        let result = viewModel.onTap(items: items)
        
        XCTAssertEqual(result.list.count, 3)
        XCTAssertEqual(result.list[2].description, "")
        XCTAssertFalse(result.list[2].checked)
        XCTAssertNotNil(result.id)
    }
    
    // Test if the buttonReset function resets all items to unchecked and stores previous list state
    func testButtonReset() {
        let viewModel = CheckListViewModel()
        let items: [ListItem] = [
            ListItem(description: "Task 1", checked: true),
            ListItem(description: "Task 2", checked: false)
        ]
        let resetItems = viewModel.buttonReset(items: items)
        
        XCTAssertFalse(resetItems[0].checked)
        XCTAssertFalse(resetItems[1].checked)
        XCTAssertEqual(viewModel.previousListState.description, items.description)
        XCTAssertEqual(viewModel.previousListState.count, items.count)
        XCTAssertFalse(viewModel.showResetButton)
    }
    
    // Test if the buttonUndo function reverts list items to their previous state before reset
    func testButtonUndo() {
        let viewModel = CheckListViewModel()
        let items: [ListItem] = [
            ListItem(description: "Task 1", checked: true),
            ListItem(description: "Task 2", checked: false)
        ]
        
        let resetItems = viewModel.buttonReset(items: items)
        
        let undoItems = viewModel.buttonUndo()
        
        XCTAssertEqual(undoItems.description, items.description)
        XCTAssertEqual(undoItems.first?.checked, items.first?.checked)
        XCTAssertEqual(undoItems.last?.checked, items.last?.checked)
        XCTAssertTrue(viewModel.showResetButton)
    }
}
