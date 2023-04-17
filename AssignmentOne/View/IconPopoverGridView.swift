//
//  IconPopoverGridView.swift
//  AssignmentOne
//
//  Created by Steele Cooke on 17/4/2023.
//

import SwiftUI

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

