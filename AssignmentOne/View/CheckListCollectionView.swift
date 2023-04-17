//
//  CheckListCollectionView.swift
//  AssignmentOne
//
//  Created by Steele Cooke on 29/3/2023.
//

import SwiftUI

/// A view that displays a list of checklists.
///
/// `CheckListCollectionView`uses it's associated viewModel CheckListCollectionViewModel to initialize the list of checklists and then displays it.
/// - Examples:
///     ```swift
///     CheckListCollectionView()
///     ```
struct CheckListCollectionView: View {
    @StateObject var viewModel = CheckListCollectionViewModel()
    
    private var title: String = "My Lists"
    
    @State private var showPopover: Bool = false
    
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
                     ForEach(viewModel.checkLists.indices, id: \.self) { index in
                         let list = viewModel.checkLists[index]
                         if !list.completed {
                             NavigationLink(destination: CheckListView(list: $viewModel.checkLists[index].items, name: $viewModel.checkLists[index].name, colourIndex: viewModel.checkLists[index].colourIndex)) {
                                 ListCheckListRowView(checkList: $viewModel.checkLists[index])
                             }
                         }
                     }
                     // The ForEach loop automatically passes the offset to the removeCheckList function.
                     .onDelete(perform: viewModel.removeCheckList)
                     .onMove(perform: viewModel.moveCheckList)
                 }
                 .listStyle(PlainListStyle())
                 
                 HStack {
                     Image(systemName: "plus.circle.fill")
                     Text("New List")
                         .font(.system(size: 16, weight: .bold, design: .rounded))
                 }
                 .padding(.horizontal)
                 .onTapGesture {
                     showPopover.toggle()
                 }
                 .popover(isPresented: $showPopover) {
                     PopoverContentView(checkLists: $viewModel.checkLists)
                 }
             }
             .navigationBarItems(trailing: EditButton())
         }
     }
 }
