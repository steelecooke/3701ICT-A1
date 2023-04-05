//
//  CheckListDataModel.swift
//  AssignmentOne
//
//  Created by Steele Cooke on 5/4/2023.
//

import Foundation

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
