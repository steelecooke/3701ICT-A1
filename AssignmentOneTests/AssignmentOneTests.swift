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

        let checklist = CheckList(name: name, items: items, colourIndex: 1, iconIndex: 1)

        XCTAssertEqual(checklist.name, name)
        XCTAssertEqual(checklist.items.description, items.description)
        XCTAssertEqual(checklist.items.count, items.count)
    }

    // Check if the generated example checklists array contains the expected number of checklists
    func testExampleCheckListsCount() throws {
        let checklists = CheckList.generateExampleCheckLists()

        XCTAssertEqual(checklists.count, 5)
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

    // Test adding an empty checklist using addEmptyCheckList in NewCheckListPopoverViewModel
    func testAddEmptyCheckList() {
        let viewModel = NewCheckListPopoverViewModel()
        let initialChecklists = CheckList.generateExampleCheckLists()
        let newCheckListName = "New Test Checklist"
        
        let updatedChecklists = viewModel.addEmptyCheckList(name: newCheckListName, checkLists: initialChecklists, colourIndex: 0, iconIndex: 4)
        
        XCTAssertEqual(updatedChecklists.count, initialChecklists.count + 1)
        XCTAssertEqual(updatedChecklists.last?.name, newCheckListName)
        XCTAssertTrue(((updatedChecklists.last?.items.isEmpty) != nil))
    }
    
    // Test if the CheckListViewModel's onDelete function correctly removes the item from the list
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
    
    // Test if the CheckListViewModel's onMove function moves the ListItem correctly
    func testOnMoveFunction() {
        // Create a CheckListCollectionViewModel instance
        let viewModel = CheckListViewModel()

        // Create a test ListItem array
        let testListItems: [ListItem] = ListItem.generateExampleList()

        // Define source and destination indices
        let source: IndexSet = [0]
        let destination = 2

        // Perform the move operation
        let movedListItems = viewModel.onMove(source: source, destination: destination, items: testListItems)

        // Check if the move operation was successful
        XCTAssertEqual(movedListItems.count, testListItems.count)
        XCTAssertEqual(testListItems[0].description, movedListItems[1].description)
    }
    
    // Test if the CheckListViewModel's onTap function creates a new ListItem and appends it to the list
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
        
        let _ = viewModel.buttonReset(items: items)
        
        let undoItems = viewModel.buttonUndo()
        
        XCTAssertEqual(undoItems.description, items.description)
        XCTAssertEqual(undoItems.first?.checked, items.first?.checked)
        XCTAssertEqual(undoItems.last?.checked, items.last?.checked)
        XCTAssertTrue(viewModel.showResetButton)
    }
    
    // Test if the CheckListCollectionViewModel's removeCheckList function works correctly
    func testRemoveCheckListFunction() {
        // Create a CheckListCollectionViewModel instance
        let viewModel = CheckListCollectionViewModel()

        // Create a test CheckList array
        let testCheckLists: [CheckList] = CheckList.generateExampleCheckLists()

        // Assign the test CheckList array to the viewModel
        viewModel.store.checkLists = testCheckLists

        // Remove the first checkList
        let indexToRemove: IndexSet = [0]
        viewModel.removeCheckList(atOffsets: indexToRemove)

        // Check if the remove operation was successful
        XCTAssertEqual(viewModel.store.checkLists.count, testCheckLists.count - 1)
    }
    
    // Test if the CheckListCollectionViewModel's moveCheckList function works correctly
    func testMoveCheckListFunction() {
        let viewModel = CheckListCollectionViewModel()
        // Create a test CheckList array
        let testCheckLists: [CheckList] = CheckList.generateExampleCheckLists()

        // Assign the test CheckList array to the viewModel
        viewModel.store.checkLists = testCheckLists

        // Move the first checkList to the end
        let sourceIndexSet: IndexSet = [0]
        let destinationIndex = viewModel.store.checkLists.count
        viewModel.moveCheckList(from: sourceIndexSet, to: destinationIndex)

        // Check if the move operation was successful
        XCTAssertEqual(viewModel.store.checkLists.last?.name, testCheckLists.first?.name)
        XCTAssertEqual(viewModel.store.checkLists.last?.colourIndex, testCheckLists.first?.colourIndex)
        XCTAssertEqual(viewModel.store.checkLists.last?.iconIndex, testCheckLists.first?.iconIndex)
    }
    
    // Test if the load function works correctly
    func testLoadFunction() async throws {
        let viewModel = CheckListCollectionViewModel()
        try await viewModel.store.load()

        // Check if the checkLists array is not nil after loading
        XCTAssertNotNil(viewModel.store.checkLists)
    }
    
    // Test if the save function works correctly
    func testSaveFunction() async throws {
        let viewModel = CheckListCollectionViewModel()
        // Create a test CheckList array
        let testCheckLists: [CheckList] = CheckList.generateExampleCheckLists()

        // Save the test CheckList array
        try await viewModel.store.save(checklists: testCheckLists)

        // Load the saved checklists
        try await viewModel.store.load()

        // Compare the saved checklists with the test checklists
        XCTAssertEqual(viewModel.store.checkLists.count, testCheckLists.count)

        for index in 0..<testCheckLists.count {
            XCTAssertEqual(viewModel.store.checkLists[index].name, testCheckLists[index].name)
            XCTAssertEqual(viewModel.store.checkLists[index].colourIndex, testCheckLists[index].colourIndex)
            XCTAssertEqual(viewModel.store.checkLists[index].iconIndex, testCheckLists[index].iconIndex)
            XCTAssertEqual(viewModel.store.checkLists[index].items.count, testCheckLists[index].items.count)
        }
    }
}
