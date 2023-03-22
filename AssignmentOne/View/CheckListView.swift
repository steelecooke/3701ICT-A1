//
//  CheckListView.swift
//  AssignmentOne
//
//  Created by Steele Cooke on 22/3/2023.
//

import SwiftUI

// Displays the contents of a provided check list
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
