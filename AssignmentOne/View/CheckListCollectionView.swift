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
    @State private var showErrorAlert: Bool = false
    @State private var isLoading: Bool = true
    
    var body: some View {
        ZStack {
            if isLoading {
                loadingView
            } else {
                contentView
            }
        }
        .task {
            do {
                try await viewModel.store.load()
                isLoading = false
            } catch {
                print("Error loading checklists: \(error)")
                showErrorAlert = true
            }
        }
        .alert(isPresented: $showErrorAlert) {
            Alert(title: Text("Error"), message: Text("There was an error loading the checklists. Please try again later."), dismissButton: .default(Text("OK")))
        }
    }
    
    private var loadingView: some View {
        VStack {
            ProgressView()
            Text("Loading checklists...")
        }
    }
    
    private var contentView: some View {
         NavigationView {
             VStack(alignment: .leading, spacing: 8) {
                 HStack {
                     Text(title)
                         .font(.system(size: 36, weight: .bold, design: .rounded))
                     Spacer()
                 }
                 .padding(.horizontal)
                 
                 List {
                     ForEach(viewModel.store.checkLists.indices, id: \.self) { index in
                         let list = viewModel.store.checkLists[index]
                         if !list.completed {
                             NavigationLink(destination: CheckListView(list: $viewModel.store.checkLists[index].items, name: $viewModel.store.checkLists[index].name, colourIndex: viewModel.store.checkLists[index].colourIndex)) {
                                 ListCheckListRowView(checkList: $viewModel.store.checkLists[index])
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
                     PopoverContentView(checkLists: $viewModel.store.checkLists)
                 }
             }
             .navigationBarItems(trailing: EditButton())
         }
     }
 }
