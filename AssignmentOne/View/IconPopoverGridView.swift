//
//  IconPopoverGridView.swift
//  AssignmentOne
//
//  Created by Steele Cooke on 17/4/2023.
//

import SwiftUI

/// A view that displays a grid of icons for selecting an icon for a new checklist.
///
/// This view is used as a part of `PopoverContentView` to allow users to choose an icon for a new checklist.
/// The user can select an icon from a `LazyVGrid` containing icons from the `GridConstants.icons` array.
///
/// - Parameters:
///     - selectedIcon: Binding<String> - A binding to a `String` representing the currently selected icon.
///
/// - Examples:
/// ```swift
/// IconPopoverGridView(selectedIcon: $selectedIcon)
/// ```
struct IconPopoverGridView: View {
    @Binding var selectedIcon: String
    
    var body: some View {
        VStack() {
            LazyVGrid(columns: GridConstants.columns, spacing: 20) {
                ForEach(GridConstants.icons, id: \.self) { icon in
                    IconView(icon: icon, selectedIcon: $selectedIcon)
                }
            }
            .padding()
        }
        .background(Color.primary.opacity(0.8))
        .cornerRadius(15)
        .padding(.horizontal)
    }
}

