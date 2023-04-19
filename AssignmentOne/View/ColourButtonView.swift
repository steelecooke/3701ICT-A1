//
//  ColourButtonView.swift
//  AssignmentOne
//
//  Created by Steele Cooke on 17/4/2023.
//

import SwiftUI

/// A view that displays a circular color button for selecting a color.
///
/// This view is used as a part of `ColourPopoverGridView` to allow users to choose a color for a new checklist.
/// When the button is tapped, the associated color is assigned to the `selectedColor` binding.
///
/// - Parameters:
///     - color: Color - The color associated with the button.
///     - selectedColor: Binding<Color> - A binding to a `Color` representing the currently selected color.
///
/// - Examples:
/// ```swift
/// ColourButtonView(color: color, selectedColor: $selectedColor)
/// ```
struct ColourButtonView: View {
    var color: Color
    @Binding var selectedColor: Color

    var body: some View {
        Button(action: {
            selectedColor = color
        }) {
            Circle()
                .fill(color)
                .frame(width: 40, height: 40)
                .overlay(
                    Circle()
                        .stroke(selectedColor == color ? Color.black : Color.clear, lineWidth: 2)
                )
        }
    }
}
