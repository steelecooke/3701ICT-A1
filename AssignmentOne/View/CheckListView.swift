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
    @State var list:[ListItem]
    var name: String
    
    var body: some View {
        NavigationView{
            List {
                ForEach(list) { item in
                    ListItemRow(item: item)
                }
            }
            .navigationTitle(name)
        }
    }
}
