//
//  ListItem.swift
//  AssignmentOne
//
//  Created by Steele Cooke on 22/3/2023.
//

import Foundation

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
