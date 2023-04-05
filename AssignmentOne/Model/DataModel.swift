//
//  ListItem.swift
//  AssignmentOne
//
//  Created by Steele Cooke on 22/3/2023.
//

import Foundation

/// A structure representing a list item in a checklist.
///
/// Each `ListItem` has a unique identifier, a description, and a checked state.
/// - Parameters:
///     - description: String - The description of a list item
///     - checked: Bool - Determines the icon for a list item (check mark = true, un-checked = false)
/// - Examples:
///     ```swift
///     ListItem(description: "Pay electricity bill", checked: true)
///     ```
///     ```swift
///     ListItem(description: "Call mom on her birthday", checked: false)
///     ```
struct ListItem: Identifiable {
    let id = UUID()
    var description: String
    var checked: Bool
    var opacity: Double = 1
    var completed: Bool = false
    var graceTime: Double = 2.0
    
    /// Generates and returns an example checklist's content.
    ///
    /// - Returns: An array of `ListItem` objects representing the example checklist.
    /// - Examples:
    ///     ```swift
    ///     @State private var list = ListItem.generateExampleList()
    ///     ```
    static func generateExampleList() -> [ListItem] {
        let list = [
            ListItem(description: "Pay electricity bill", checked: true),
            ListItem(description: "Call mom on her birthday", checked: false),
            ListItem(description: "Buy groceries for the week", checked: true),
            ListItem(description: "Attend dentist appointment on Monday", checked: false),
            ListItem(description: "Submit report to boss by Friday", checked: true),
            ListItem(description: "Renew gym membership before it expires", checked: false),
            ListItem(description: "Book flight tickets for summer vacation", checked: true),
            ListItem(description: "Schedule car maintenance check-up", checked: false),
            ListItem(description: "Return library books before the due date", checked: true),
            ListItem(description: "Pay credit card bill by the end of the month", checked: false)
        ]
        
        return list
    }
}

// ... ListItem struct and its associated functions ...

/// A structure representing a checklist containing multiple list items.
///
/// Each `CheckList` has a unique identifier, a name, and an array of `ListItem` objects.
/// - Parameters:
///     - name: String - The name of the checklist
///     - items: [ListItem] - An array of `ListItem` objects representing the list items in the checklist
/// - Examples:
///     ```swift
///     CheckList(name: "First checklist!", items: [ListItem(description: "Pay electricity bill", checked: true), ListItem(description: "Call mom on her birthday", checked: false)])
///     ```
///     ```swift
///     CheckList(name: "First checklist!", items: list),
///     ```
struct CheckList: Identifiable {
    let id = UUID()
    
    var name:String
    var items:[ListItem]
    
    var opacity: Double = 1
    var completed: Bool = false
    var graceTime: Double = 2.0
    
    /// Generates and returns an example array of checklists.
    ///
    /// - Returns: An array of `CheckList` objects representing the example checklists.
    /// - Examples:
    ///     ```swift
    ///     @State private var checklists = CheckList.generateExampleCheckLists()
    ///     ```
    static func generateExampleCheckLists() -> [CheckList] {
        let list = ListItem.generateExampleList()
        
        let checkLists = [
            CheckList(name: "First checklist!", items: list),
            CheckList(name: "Second checklist!", items: list),
            CheckList(name: "Third checklist!", items: list),
            CheckList(name: "Fourth checklist!", items: list),
            CheckList(name: "Fith checklist!", items: list)
        ]
        
        return checkLists
    }
}
