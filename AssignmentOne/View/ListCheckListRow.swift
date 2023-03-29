//
//  ListCheckListRow.swift
//  AssignmentOne
//
//  Created by Steele Cooke on 29/3/2023.
//

import SwiftUI

struct ListCheckListRow: View {
    @Binding var checkList:CheckList
    
    var body: some View {
        HStack {
            Text(checkList.name)
                .opacity(checkList.opacity)
            Spacer()
            Text("\(checkList.items.count)")
                .opacity(0.5)
        }
    }
}

