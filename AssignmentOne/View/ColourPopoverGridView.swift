//
//  ColourPopoverGridView.swift
//  AssignmentOne
//
//  Created by Steele Cooke on 17/4/2023.
//

import SwiftUI

/// A view that displays a grid of colors for selecting a color for a new checklist.
///
/// This view is used as a part of `PopoverContentView` to allow users to choose a color for a new checklist.
/// The user can select a color from a `LazyVGrid` containing colors from the `GridConstants.colors` array.
///
/// - Parameters:
///     - selectedColor: Binding<Color> - A binding to a `Color` representing the currently selected color.
///
/// - Examples:
/// ```swift
/// ColourPopoverGridView(selectedColor: $selectedColor)
/// ```
struct ColourPopoverGridView: View {
    @Binding var selectedColor: Color
    
    var body: some View {
        VStack() {
            LazyVGrid(columns: GridConstants.columns, spacing: 20) {
                ForEach(GridConstants.colors, id: \.self) { color in
                    ColourButtonView(color: color, selectedColor: $selectedColor)
                }
            }
            .padding()
        }
        .background(Color.primary.opacity(0.8))
        .cornerRadius(15)
        .padding(.horizontal)
    }
}
