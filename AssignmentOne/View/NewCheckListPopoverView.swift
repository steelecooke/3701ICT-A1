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
/// - Variables:
///     - viewModel: NewCheckListPopoverViewModel - The ViewModel associated with the view.
///     - isTextFieldFocused - Bool - Used to focus the textfield so the user is automatically focused when the popover opens.
///     - selectedColor - Color - Used to determine the colour the end user is selecting for the checklist.
///     - selectedIcon - String - Used to determine the SF Symbol for the checklist the user selected.
/// - Examples:
/// ```swift
///HStack {
///    Image(systemName: "plus.circle.fill")
///    Text("New List")
///        .font(.system(size: 16, weight: .bold, design: .rounded))
///}
///.padding(.horizontal)
///.onTapGesture {
///    showPopover.toggle()
///}
///.popover(isPresented: $showPopover) {
///    PopoverContentView(checkLists: $viewModel.store.checkLists)
///}
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
                        checkLists = viewModel.addEmptyCheckList(name: viewModel.name, checkLists: checkLists, colourIndex: GridConstants.colors.firstIndex { $0 == selectedColor } ?? 0, iconIndex: GridConstants.icons.firstIndex(of: selectedIcon) ?? 0)
                        dismiss()
                    }
                    .disabled(viewModel.name.isEmpty)
                }
            }
        }
    }
}
