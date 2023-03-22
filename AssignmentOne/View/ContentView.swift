//
//  ContentView.swift
//  AssignmentOne
//
//  Created by Steele Cooke on 19/3/2023.
//

import SwiftUI

// Main application view
struct ContentView: View {
    @State var list = ListItem.generateExampleList()
    @State var listName = "Reminders 2"
    
    var body: some View {
        CheckListView(list: list, name: listName)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
