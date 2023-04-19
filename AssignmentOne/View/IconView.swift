//
//  IconView.swift
//  AssignmentOne
//
//  Created by Steele Cooke on 17/4/2023.
//

import SwiftUI

/// A view that displays an icon button for selecting an icon.
///
/// This view is used as a part of `IconPopoverGridView` to allow users to choose an icon for a new checklist.
/// When the button is tapped, the associated icon is assigned to the `selectedIcon` binding.
///
/// - Parameters:
///     - icon: String - The SF Symbol name associated with the button.
///     - selectedIcon: Binding<String> - A binding to a `String` representing the currently selected icon.
///
/// - Examples:
/// ```swift
/// IconView(icon: icon, selectedIcon: $selectedIcon)
/// ```
struct IconView: View {
    var icon: String
    @Binding var selectedIcon: String

    var body: some View {
        Button(action: {
            selectedIcon = icon
        }) {
            ZStack() {
                Circle()
                    .fill(Color.primary.opacity(0.4))
                    .frame(width: 40, height: 40)
                    .overlay(
                        ZStack {
                            Circle()
                                .stroke(Color.gray, lineWidth: selectedIcon == icon ? 1 : 0)
                            
                            Circle()
                                .stroke(selectedIcon == icon ? Color.black : Color.clear, lineWidth: 2)
                        }
                    )
                Image(systemName: icon)
                    .font(.system(size: 20))
                    .foregroundColor(Color.white)
            }
        }
    }
}
