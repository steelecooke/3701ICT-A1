//
//  ListItemRow.swift
//  AssignmentOne
//
//  Created by Steele Cooke on 22/3/2023.
//

import SwiftUI

/// A view that displays a single checklist item.
///
/// `ListItemRow` takes a `ListItem` object as input and displays its description along with a checkmark circle icon indicating its checked state. Additionally, it supports focusing on the TextField when a new item is added.
/// - Parameters:
///     - item: ListItem - A `ListItem` object representing a checklist item
///     - focusedField: ListItem.ID? - A binding to the focused field's ID. This is used to focus on the TextField when a new item is added.
/// - Examples:
///     ```swift
///     ListItemRow(item: ListItem(description: "Pay electricity bill", checked: true), focusedField: _focusedField)
///     ```
///     ```swift
///     ListItemRow(item: ListItem(description: "Call mom on her birthday", checked: false), focusedField: _focusedField)
///     ```
///     ```swift
///     ListItemRow(item: $item, focusedField: _focusedField)
///     ```
struct ListItemRow: View {
    @Binding var item: ListItem
    @FocusState var focusedField: ListItem.ID?

    var body: some View {
        ZStack {
            HStack {
                ZStack {
                    if item.checked {
                        Image(systemName: "checkmark.circle.fill")
                    } else {
                        Image(systemName: "circle")
                    }
                }
                .onTapGesture {
                    item.checked.toggle()
                }
                ZStack {
                    TextField(item.description, text: $item.description)
                        .foregroundColor(item.checked ? Color.gray : Color.primary)
                        .opacity(item.opacity)
                        .focused($focusedField, equals: item.id)
                }
            }
        }
    }
}
