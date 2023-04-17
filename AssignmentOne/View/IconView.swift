//
//  IconView.swift
//  AssignmentOne
//
//  Created by Steele Cooke on 17/4/2023.
//

import SwiftUI

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
