//
//  GridConstantsDataModel.swift
//  AssignmentOne
//
//  Created by Steele Cooke on 17/4/2023.
//

import Foundation
import SwiftUI

struct GridConstants {
    static let colors: [Color] = [
        .red, .orange, .yellow, .green, .cyan, .blue, .purple, .pink, .brown, .gray, .primary
    ]
    static let icons: [String] = [
        "checklist", "list.bullet", "list.number", "pencil", "scribble", "highlighter", "pencil.and.outline", "lasso", "bandage", "sun.max", "moon", "airplane", "car", "icloud", "network", "house", "gamecontroller", "circle.grid.cross"
    ]
    static let columns: [GridItem] = Array(repeating: .init(.flexible()), count: 7)
    
    enum GridType {
        case icons
        case colors
    }
}
