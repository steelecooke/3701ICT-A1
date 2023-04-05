//
//  NewCheckListPopoverViewModel.swift
//  AssignmentOne
//
//  Created by Steele Cooke on 5/4/2023.
//

import Foundation

/// The ViewModel for the associated view NewCheckListPopoverView.
///
/// `NewCheckListPopoverViewModel` is responsible for handling business logic for the it's associated view.
/// It handles updating a provided list of CheckList.
/// - Functions:
///     - addEmptyCheckList - Creates an empty CheckList and appends it to a passed [CheckList] variable returning the updated [CheckList].
class NewCheckListPopoverViewModel: ObservableObject {

    /// Creates an empty CheckList and appends it to a passed [CheckList] variable returning the updated [CheckList].
    /// - Parameters:
    ///   - name - String - A name to be given to the new empty CheckList
    ///   - checkLists - [CheckList] - An existing [CheckList] variable to appened the empty list to and return.
    /// - Returns: [CheckList]
    /// - Examples:
    ///     ```swift
    /// checkLists = viewModel.addEmptyCheckList(name: name, checkLists: checkLists)
    ///     ```
    func addEmptyCheckList(name: String, checkLists: [CheckList]) -> [CheckList] {
        let items: [ListItem] = []
        var lists = checkLists
        lists.append(CheckList(name: name, items: items))
        
        return lists
    }
}
