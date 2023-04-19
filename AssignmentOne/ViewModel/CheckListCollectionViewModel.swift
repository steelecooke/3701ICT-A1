//
//  CheckListCollectionViewModel.swift
//  AssignmentOne
//
//  Created by Steele Cooke on 5/4/2023.
//

/// The ViewModel for the associated view CheckListCollectionView.
///
/// `CheckListCollectionViewModel` is responsible for handling business logic for the it's associated view.
/// It initializes the `list` and `listName` states and passes them to the `CheckListView`.
/// - Variables:
///     - store - A store object that contains an array of `CheckList`. Used to handle data persistence of the app's checklists.
/// - Functions:
///     - removeCheckList - Removes a checklist from the list of checklists at a given offset.
///     -- moveCheckList - Moves a checklist from one position to another within the list of checklists.

import Foundation

class CheckListCollectionViewModel: ObservableObject {
    @Published var store = ChecklistStore()
    
    /// Removes a checklist from the list of checklists at a given offset.
    ///
    /// - Returns: No return.
    /// - Examples:
    ///     ```swift
    ///List {
    ///ForEach(viewModel.store.checkLists.indices, id: \.self) { index in
    ///    let list = viewModel.store.checkLists[index]
    ///    if !list.completed {
    ///        NavigationLink(destination: CheckListView(list: $viewModel.store.checkLists[index].items, name: $viewModel.store.checkLists[index].name, colourIndex:       viewModel.store.checkLists[index].colourIndex)) {
    ///            ListCheckListRowView(checkList: $viewModel.store.checkLists[index])
    ///        }
    ///    }
    ///}
    /// The ForEach loop automatically passes the offset to the removeCheckList function.
    ///.onDelete(perform: viewModel.removeCheckList)
    ///}
    ///     ```
    func removeCheckList(atOffsets offsets: IndexSet) {
        store.checkLists.remove(atOffsets: offsets)
    }
    
    /// Moves a checklist from one position to another within the list of checklists.
    ///
    /// - Parameters:
    ///     - source: IndexSet - The current position of the checklist in the list.
    ///     - destination: Int - The new position of the checklist in the list.
    /// - Returns: No return.
    /// - Examples:
    ///     ```swift
    ///List {
    ///ForEach(viewModel.store.checkLists.indices, id: \.self) { index in
    ///    let list = viewModel.store.checkLists[index]
    ///    if !list.completed {
    ///        NavigationLink(destination: CheckListView(list: $viewModel.store.checkLists[index].items, name: $viewModel.store.checkLists[index].name, colourIndex:       viewModel.store.checkLists[index].colourIndex)) {
    ///            ListCheckListRowView(checkList: $viewModel.store.checkLists[index])
    ///        }
    ///    }
    ///}
    /// The ForEach loop automatically passes the offset to the removeCheckList function.
    ///.onMove(perform: viewModel.moveCheckList)
    ///}
    ///     ```
    func moveCheckList(from source: IndexSet, to destination: Int) {
        store.checkLists.move(fromOffsets: source, toOffset: destination)
    }
}
