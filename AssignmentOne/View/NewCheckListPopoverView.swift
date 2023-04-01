//
//  NewCheckListPopoverView.swift
//  AssignmentOne
//
//  Created by Steele Cooke on 2/4/2023.
//

import SwiftUI

struct PopoverContentView: View {
    @Binding var checkLists: [CheckList]
    
    @Environment(\.dismiss) var dismiss

    @State private var name: String = ""
    @State private var buttonDone: Bool = false
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack(spacing: 8) {
                    Image(systemName: "checklist")
                        .font(.system(size: 64))
                        .padding()
                    ZStack() {
                        TextField("New List", text: $name)
                            .multilineTextAlignment(.center)
                    }
                    .padding()
                    .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.gray, lineWidth: 1))
                    Spacer()
                }
                .padding(.horizontal)
                .background(Color(.systemBackground))
            }
            .navigationTitle("New List")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Done") {
                        // Refactor this addition to it's own function
                        let items: [ListItem] = []
                        checkLists.append(CheckList(name: name, items: items))
                        dismiss()
                    }
                    .disabled(name.isEmpty)
                }
            }
        }
    }
}
