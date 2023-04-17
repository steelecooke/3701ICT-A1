//
//  NewCheckListPopoverView.swift
//  AssignmentOne
//
//  Created by Steele Cooke on 2/4/2023.
//

import SwiftUI

/// A view that displays a popover for creating a new checklist.
/// - Parameters:
///     - checkLists: [CheckList] - An array of `CheckList` objects representing all CheckLists in the app.
/// `NewCheckListPopoverView`uses it's associated viewModel NewCheckListPopoverViewModel to append to the checklist as required..
/// - Variables
///     - isTextFieldFocused - Bool - Used to focus the textfield so the user is automatically focused when the popover opens.
/// - Examples:
///     ```swift
/// ForEach(viewModel.checkLists.indices, id: \.self) { index in
///     let list = viewModel.checkLists[index]
///     if !list.completed {
///         NavigationLink(destination: CheckListView(list: $viewModel.checkLists[index].items, name: $viewModel.checkLists[index].name)) {
///             ListCheckListRowView(checkList: $viewModel.checkLists[index])
///         }
///     }
/// }
///     ```
struct PopoverContentView: View {
    @Environment(\.dismiss) var dismiss
    @Binding var checkLists: [CheckList]
    
    @StateObject var viewModel = NewCheckListPopoverViewModel()
    @FocusState private var isTextFieldFocused: Bool
    
    @State var selectedColor: Color = Color.primary
    @State var selectedIcon: String = "checklist"
    
    var body: some View {
        NavigationView {
            VStack() {
                VStack(spacing: 8) {
                    ZStack {
                        Circle()
                            .fill(selectedColor)
                            .frame(width: 100, height: 100)
                            .shadow(color: Color.black.opacity(0.5), radius: 5)
                        Image(systemName: selectedIcon)
                            .font(.system(size: 50))
                            .foregroundColor(Color.white)
                    }
                    .padding()
                    ZStack() {
                        TextField("New List", text: $viewModel.name)
                            .multilineTextAlignment(.center)
                            .focused($isTextFieldFocused)
                    }
                    .padding()
                    .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.gray, lineWidth: 1))
                }
                .padding(.horizontal)
                .background(Color(.systemBackground))
                .onAppear {
                    isTextFieldFocused = true
                }
                ColourPopoverGridView(selectedColor: $selectedColor)
                IconPopoverGridView(selectedIcon: $selectedIcon)
                Spacer()
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
                        checkLists = viewModel.addEmptyCheckList(name: viewModel.name, checkLists: checkLists)
                        dismiss()
                    }
                    .disabled(viewModel.name.isEmpty)
                }
            }
        }
    }
}
