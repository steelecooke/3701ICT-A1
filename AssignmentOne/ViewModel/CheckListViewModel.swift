//
//  CheckListViewModel.swift
//  AssignmentOne
//
//  Created by Steele Cooke on 5/4/2023.
//

import Foundation

/// The ViewModel for the associated view CheckListView.
///
/// `CheckListViewModel` is responsible for handling business logic for the it's associated view.
/// It handles updating a provided list of CheckList and the onDelete, onTap functions as well as the undo and reset button functionality.
/// - Variables:
///     - showResetButton - Bool - Determines if the reset button should be displayed.
///     - previousListState - [ListItem] - The previous state of a [ListItem] variable used to undo the changes made by clicking the reset button.
/// - Functions:
///     - onTap - Used to create a new list item when the add button is tapped. Returns the new item's ID so we can focus the new field.
///     - onDelete - Used to delete a list item when the user in edit mode and clicks the delete UI element.
///     - buttonReset - Resets all items in a [ListItem] so that they are unchecked.
///     - buttonUndo - Reverts the previous Reset button change reverting each item in a [ListItem] back to their checked state before it was tapped.

class CheckListViewModel: ObservableObject {
    
    @Published var showResetButton: Bool = true
    @Published var previousListState: [ListItem] = []
    
    /// The function to run when a list item in edit mode is deleted.
    /// Takes an offset, and an existing list of [ListItem], removes the element at the given offset and then returnes the updated list.
    /// - Parameters:
    ///     - offsets - IndexSet - Offset used to delete the element.
    ///     - items - [ListItems] - The list of [ListItem] to manipulate and delete the element from.
    /// - Variables:
    ///     - list - The mutatable list of items taken from the given items parameter and returned.
    /// - Returns:
    ///     - [ListItem] - Updated [ListItem] that doesn't contain the deleted element.
    func onDelete(atOffsets offsets: IndexSet, items: [ListItem]) -> [ListItem] {
        var list = items
        list.remove(atOffsets: offsets)
        
        return list
    }
    
    /// The function to run when the add button is tapped.
    /// Creates a new list item, appends it to the existing list, and returns the updated list and the new item's ID.
    /// - Parameters:
    ///     - items - [ListItem] - The existing list of [ListItem] to append the new item to.
    /// - Variables:
    ///     - list - The mutable list of items taken from the given items parameter and returned.
    ///     - newItem - ListItem - The new item to be appended to the list.
    /// - Returns:
    ///     - (list: [ListItem], id: UUID) - A tuple containing the updated [ListItem] with the new item appended, and the new item's ID.
    func onTap(items: [ListItem]) -> (list: [ListItem], id: UUID) {
        var list = items
        let newItem = ListItem(description: "", checked: false)
        list.append(newItem)
        
        return (list, newItem.id)
    }
    
    /// The function to run when the reset button is tapped.
    /// Resets all items in a [ListItem] so that they are unchecked, stores the previous list state for undo, and toggles the showResetButton.
    /// - Parameters:
    ///     - items - [ListItem] - The list of [ListItem] to reset.
    /// - Variables:
    ///     - list - The mutable list of items taken from the given items parameter and returned.
    /// - Returns:
    ///     - [ListItem] - Updated [ListItem] with all items unchecked.
    func buttonReset(items: [ListItem]) -> [ListItem] {
        var list = items
        previousListState = list
        for index in list.indices {
            list[index].checked = false
        }
        showResetButton.toggle()
        
        return list
    }
    
    /// The function to run when the undo button is tapped.
    /// Reverts the previous reset button change, reverting each item in a [ListItem] back to their checked state before it was tapped, and toggles the showResetButton.
    /// - Returns:
    ///     - [ListItem] - The previous state of the [ListItem] before the reset button was tapped.
    func buttonUndo() -> [ListItem] {
        showResetButton.toggle()
        
        return previousListState
    }
}
