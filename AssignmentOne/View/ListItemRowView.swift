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
    
    var body: some View {
        HStack {
            if item.checked {
                Image(systemName: "checkmark.circle.fill")
            } else {
                Image(systemName: "circle")
            }
            Text(item.description)
                .foregroundColor(item.checked ? Color.gray : Color.primary)
                .opacity(item.opacity)
        }.onTapGesture {
            item.checked = !item.checked
            item.graceTime = 2.0
            
            Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { timer in
                item.graceTime -= 0.1
                if item.graceTime <= 0 {
                    if item.checked {
                        DispatchQueue.main.asyncAfter(deadline: .now()) {
                            withAnimation(.easeInOut(duration: 0.5)) {
                                item.opacity = 0.0
                            }
                        }
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                            item.completed = true
                        }
                    }
                }
            }
        }
    }
}
