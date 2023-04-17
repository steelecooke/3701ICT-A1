//
//  ColourPopoverGridView.swift
//  AssignmentOne
//
//  Created by Steele Cooke on 17/4/2023.
//

import SwiftUI

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
