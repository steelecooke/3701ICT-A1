//
//  CheckListView.swift
//  AssignmentOne
//
//  Created by Steele Cooke on 22/3/2023.
//

import SwiftUI

/// A view that displays the contents of a provided checklist.
///
/// `CheckListView` takes an array of `ListItem` objects and a name as input and displays a list of items with their checked states.
/// - Parameters:
///     - list: [ListItem] - An array of `ListItem` objects representing the checklist items
///     - name: String - The name of the checklist, which will be displayed as the navigation title
/// - Examples:
///     ```swift
///     CheckListView(list: list, name: "Reminders")
///     ```
struct CheckListView: View {
    @Binding var list:[ListItem]
    @Binding var name: String

    @FocusState private var focusedField: ListItem.ID?

    @State private var showResetButton: Bool = true
    @State private var previousListState: [ListItem] = []
    
    @Environment(\.editMode) var editMode
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Text(name)
                    .font(.system(size: 36, weight: .bold, design: .rounded))
                Spacer()
            }
            .padding(.horizontal)
            HStack {
                List {
                    ForEach($list) { $item in
                        if !item.completed {
                            ListItemRow(item: $item, focusedField: _focusedField)
                        }
                    }
                    .onDelete(perform: onDelete)
                }
                .listStyle(PlainListStyle())
            }
            HStack {
                Image(systemName: "plus.circle.fill")
                Text("New List Item")
                    .font(.system(size: 16, weight: .bold, design: .rounded))
            }
            .padding(.horizontal)
            .onTapGesture {
                let newItem = ListItem(description: "", checked: false)
                list.append(newItem)
                // This async provides time for the list item to render so it can be focused.
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                    focusedField = newItem.id
                }
            }
            .toolbar {
                if editMode?.wrappedValue.isEditing == true {
                    if showResetButton {
                        ToolbarItem(placement: .navigationBarTrailing) {
                            Button("Reset", action: {
                                previousListState = list
                                for index in list.indices {
                                    list[index].checked = false
                                }
                                showResetButton.toggle()
                            })
                        }
                    } else {
                        ToolbarItem(placement: .navigationBarTrailing) {
                            Button("Undo", action: {
                                list = previousListState
                                showResetButton.toggle()
                            })
                        }
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
            }
        }
    }
    //Refactor this into its own function
    func onDelete(offset: IndexSet) {
        list.remove(atOffsets: offset)
    }
}
