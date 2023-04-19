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
///     - colourIndex - Int - The colour index used to update the checklist title and add item button colour.
/// - Variables:
///     - focusField - UUID - Uses a list item's UUID to determine which textfield to focus in the ListItemRow View.
/// - Examples:
///     ```swift
///     CheckListView(list: list, name: "Reminders")
///     ```
struct CheckListView: View {
    @Binding var list:[ListItem]
    @Binding var name: String
    
    var colourIndex: Int

    @StateObject var viewModel = CheckListViewModel()
    
    @FocusState private var focusedField: ListItem.ID?
    
    @Environment(\.editMode) var editMode
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                if editMode?.wrappedValue.isEditing == true {
                    TextField(name, text: $name)
                        .foregroundColor(GridConstants.colors[colourIndex])
                        .font(.system(size: 36, weight: .bold, design: .rounded))
                } else {
                    Text(name)
                        .foregroundColor(GridConstants.colors[colourIndex])
                        .font(.system(size: 36, weight: .bold, design: .rounded))
                }
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
                    .onDelete(perform: { indexSet in
                        list = viewModel.onDelete(atOffsets: indexSet, items: list)
                    })
                    .onMove(perform: { source, destination in
                        list = viewModel.onMove(source: source, destination: destination, items: list)
                    })
                }
                .listStyle(PlainListStyle())
            }
            HStack {
                Image(systemName: "plus.circle.fill")
                    .foregroundColor(GridConstants.colors[colourIndex])
                Text("New List Item")
                    .foregroundColor(GridConstants.colors[colourIndex])
                    .font(.system(size: 16, weight: .bold, design: .rounded))
            }
            .padding(.horizontal)
            .onTapGesture {
                let result = viewModel.onTap(items: list)
                list = result.list
                // This async provides time for the list item to render so it can be focused.
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                    focusedField = result.id
                }
            }
            .toolbar {
                if editMode?.wrappedValue.isEditing == true {
                    if viewModel.showResetButton {
                        ToolbarItem(placement: .navigationBarTrailing) {
                            Button("Reset", action: {
                                list = viewModel.buttonReset(items: list)
                            })
                        }
                    } else {
                        ToolbarItem(placement: .navigationBarTrailing) {
                            Button("Undo", action: {
                                list = viewModel.buttonUndo()
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
}
