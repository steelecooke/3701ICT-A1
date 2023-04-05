//
//  NewCheckListPopoverView.swift
//  AssignmentOne
//
//  Created by Steele Cooke on 2/4/2023.
//

import SwiftUI

struct PopoverContentView: View {
    @Environment(\.dismiss) var dismiss

    @Binding var checkLists: [CheckList]
    
    @StateObject var viewModel = NewCheckListPopoverViewModel()
    @State private var name: String = ""
    @State private var buttonDone: Bool = false
    
    @FocusState private var isTextFieldFocused: Bool
    
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
                            .focused($isTextFieldFocused)
                    }
                    .padding()
                    .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.gray, lineWidth: 1))
                    Spacer()
                }
                .padding(.horizontal)
                .background(Color(.systemBackground))
                .onAppear {
                    isTextFieldFocused = true
                }
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
                        checkLists = viewModel.addEmptyCheckList(name: name, checkLists: checkLists)
                        dismiss()
                    }
                    .disabled(name.isEmpty)
                }
            }
        }
    }
}
