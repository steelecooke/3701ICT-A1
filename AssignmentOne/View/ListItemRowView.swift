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
    var item: ListItem
    
    var body: some View {
        HStack {
            if item.checked {
                Image(systemName: "checkmark.circle.fill")
            } else {
                Image(systemName: "circle")
            }
            Text(item.description)
        }
    }
}
