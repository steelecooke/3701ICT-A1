//
//  ListItemRow.swift
//  AssignmentOne
//
//  Created by Steele Cooke on 22/3/2023.
//

import SwiftUI

// Displays the check list row view for each individual item
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
