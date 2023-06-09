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
/// - Variables:
///     - name - String - Contains the name of the new CheckList a user is creating.
///     - buttonDone - Bool - Used to determine if the done button should be disabled or enabled.
/// - Functions:
///     - addEmptyCheckList - Creates an empty CheckList and appends it to a passed [CheckList] variable returning the updated [CheckList].
class NewCheckListPopoverViewModel: ObservableObject {

    @Published var name: String = ""
    @Published var buttonDone: Bool = false
    
    /// Creates an empty CheckList and appends it to a passed [CheckList] variable returning the updated [CheckList].
    /// - Parameters:
    ///   - name - String - A name to be given to the new empty CheckList
    ///   - checkLists - [CheckList] - An existing [CheckList] variable to appened the empty list to and return.
    ///   - colourIndex - Int - The selected colour by the user relating to the colours array in the GridConstantsDataModel struct.
    ///   - iconIndex: Int - The selected icon by the user relating to the icons array in the GridConstantsDataModel struct.
    /// - Returns: [CheckList]
    /// - Examples:
    ///     ```swift
    /// checkLists = viewModel.addEmptyCheckList(name: viewModel.name, checkLists: checkLists, colourIndex: GridConstants.colors.firstIndex { $0 == selectedColor } ?? 0, iconIndex: GridConstants.icons.firstIndex(of: selectedIcon) ?? 0)
    ///     ```
    func addEmptyCheckList(name: String, checkLists: [CheckList], colourIndex: Int, iconIndex: Int) -> [CheckList] {
        let items: [ListItem] = []
        var lists = checkLists
        lists.append(CheckList(name: name, items: items, colourIndex: colourIndex, iconIndex: iconIndex))
        
        return lists
    }
}
