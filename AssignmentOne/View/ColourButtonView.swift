//
//  ColourButtonView.swift
//  AssignmentOne
//
//  Created by Steele Cooke on 17/4/2023.
//

import SwiftUI

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
