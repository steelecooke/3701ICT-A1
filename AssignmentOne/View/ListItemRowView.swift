//
//  ListItemRow.swift
//  AssignmentOne
//
//  Created by Steele Cooke on 22/3/2023.
//

import SwiftUI

/// A view that displays a single checklist item.
///
/// `ListItemRow` takes a `ListItem` object as input and displays its description along with a checkmark circle icon indicating its checked state.
/// - Parameters:
///     - item: ListItem - A `ListItem` object representing a checklist item
/// - Examples:
///     ```swift
///     ListItemRow(item: ListItem(description: "Pay electricity bill", checked: true))
///     ```
///     ```swift
///     ListItemRow(item: ListItem(description: "Call mom on her birthday", checked: false))
///     ```
struct ListItemRow: View {
    @Binding var item: ListItem
    @State private var timer: Timer? = nil

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
                    toggleItem()
                }
                ZStack {
                    TextField(item.description, text: $item.description)
                        .foregroundColor(item.checked ? Color.gray : Color.primary)
                        .opacity(item.opacity)
                }
            }
        }
    }
    
    private func toggleItem() {
        item.checked.toggle()
    }
}
