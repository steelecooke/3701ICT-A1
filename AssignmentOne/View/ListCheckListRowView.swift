//
//  ListCheckListRowView.swift
//  AssignmentOne
//
//  Created by Steele Cooke on 29/3/2023.
//

import SwiftUI

/// A view that displays each row of a CheckList.
///
/// `ListCheckListRowView` takes a `CheckList` variable and displays it's name and respective item count in a HStack with formatting.
/// - Parameters:
///     - checkList: CheckList - An indiviudal CheckList used for displaying it's name and items count in a HStack with formatting.
/// - Examples:
///     ```swift
///     ListCheckListRowView(checkList: $viewModel.checkLists[index])
///     ```
struct ListCheckListRowView: View {
    @Binding var checkList:CheckList
    
    var body: some View {
        HStack {
            ZStack {
                Circle()
                    .fill(GridConstants.colors[checkList.colourIndex])
                    .frame(width: 30, height: 30)
                Image(systemName: GridConstants.icons[checkList.iconIndex])
                    .foregroundColor(Color.white)
            }
            Text(checkList.name)
                .opacity(checkList.opacity)
            Spacer()
            Text("\(checkList.items.count)")
                .opacity(0.5)
        }
    }
}

