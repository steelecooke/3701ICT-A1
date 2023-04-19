//
//  GridConstantsDataModel.swift
//  AssignmentOne
//
//  Created by Steele Cooke on 17/4/2023.
//

import Foundation
import SwiftUI

/// A struct containing constants for grid-related views in the app.
///
/// `GridConstants` includes predefined arrays of colors, icons, and columns for grid views in the application.
///
/// - Variables:
///     - colors: [Color] - An array of `Color` objects representing available colors for checklists.
///     - icons: [String] - An array of `String` objects representing the names of available icons for checklists.
///     - columns: [GridItem] - An array of `GridItem` objects representing the grid layout for the grid views.
///
/// - Examples:
/// ```swift
/// LazyVGrid(columns: GridConstants.columns, spacing: 20) {
///     ForEach(GridConstants.colors, id: \.self) { color in
///         ColourButtonView(color: color, selectedColor: $selectedColor)
///     }
/// }
/// .padding()
/// ```
struct GridConstants {
    static let colors: [Color] = [
        .red, .orange, .yellow, .green, .cyan, .blue, .purple, .pink, .brown, .gray, .primary
    ]
    static let icons: [String] = [
        "checklist", "list.bullet", "list.number", "pencil", "scribble", "highlighter", "pencil.and.outline", "lasso", "bandage", "sun.max", "moon", "airplane", "car", "icloud", "network", "house", "gamecontroller", "circle.grid.cross"
    ]
    static let columns: [GridItem] = Array(repeating: .init(.flexible()), count: 7)
}
