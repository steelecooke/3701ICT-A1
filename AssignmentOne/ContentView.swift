//
//  ContentView.swift
//  AssignmentOne
//
//  Created by Steele Cooke on 19/3/2023.
//

import SwiftUI

// Structure for a list item that appears as a row in a check list
struct ListItem: Identifiable {
    let id = UUID()
    var description: String
    var checked: Bool
    
    // Generates and returns an example checklist's content
    static func generateExampleList() -> [ListItem] {
        let list = [
            ListItem(description: "Pay electricity bill", checked: true),
            ListItem(description: "Call mom on her birthday", checked: false),
            ListItem(description: "Buy groceries for the week", checked: true),
            ListItem(description: "Attend dentist appointment on Monday", checked: false),
            ListItem(description: "Submit report to boss by Friday", checked: true),
            ListItem(description: "Renew gym membership before it expires", checked: false),
            ListItem(description: "Book flight tickets for summer vacation", checked: true),
            ListItem(description: "Schedule car maintenance check-up", checked: false),
            ListItem(description: "Return library books before the due date", checked: true),
            ListItem(description: "Pay credit card bill by the end of the month", checked: false)
        ]
        
        return list
    }
}

// Main application view
struct ContentView: View {
    @State var list = ListItem.generateExampleList()
    @State var listName = "Reminders 2"
    
    var body: some View {
        CheckListView(list: list, name: listName)
    }
}

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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
