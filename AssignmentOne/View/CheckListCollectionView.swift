//
//  CheckListCollectionView.swift
//  AssignmentOne
//
//  Created by Steele Cooke on 29/3/2023.
//

import SwiftUI

struct CheckListCollectionView: View {
    @Binding var checkLists:[CheckList]
    var title: String = "My Lists"
    
    var body: some View {
         NavigationView {
             VStack(alignment: .leading, spacing: 8) {
                 HStack {
                     Text(title)
                         .font(.system(size: 36, weight: .bold, design: .rounded))
                     Spacer()
                 }
                 .padding(.horizontal)
                 
                 List {
                     ForEach($checkLists) { $list in
                         if !list.completed {
                             NavigationLink(destination: CheckListView(list: $list.items, name: $list.name)) {
                                 ListCheckListRow(checkList: $list)
                             }
                         }
                     }
                 }
                 .listStyle(PlainListStyle())
             }
         }
     }
 }
