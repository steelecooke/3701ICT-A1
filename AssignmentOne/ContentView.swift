//
//  ContentView.swift
//  AssignmentOne
//
//  Created by Steele Cooke on 19/3/2023.
//

import SwiftUI

struct listItem: Identifiable {
    let id = UUID()
    var description: String
    var checked: Bool
}

struct ContentView: View {
    
    @State var list = [
        listItem(description: "Pay electricity bill", checked: true),
        listItem(description: "Call mom on her birthday", checked: false),
        listItem(description: "Buy groceries for the week", checked: true),
        listItem(description: "Attend dentist appointment on Monday", checked: false),
        listItem(description: "Submit report to boss by Friday", checked: true),
        listItem(description: "Renew gym membership before it expires", checked: false),
        listItem(description: "Book flight tickets for summer vacation", checked: true),
        listItem(description: "Schedule car maintenance check-up", checked: false),
        listItem(description: "Return library books before the due date", checked: true),
        listItem(description: "Pay credit card bill by the end of the month", checked: false)
    ]
    
    var body: some View {
        CheckListView(list: list)

    }
}

struct CheckListView: View {
    var list:[listItem]
    
    var body: some View {
        NavigationView{
            List {
                ForEach(list) { list in
                    HStack {
                        if list.checked {
                            Image(systemName: "checkmark.circle.fill")
                        } else {
                            Image(systemName: "circle")
                        }
                        /*@START_MENU_TOKEN@*/Text(list.description)/*@END_MENU_TOKEN@*/
                    }
                }
            }
            .navigationTitle("Reminders")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
