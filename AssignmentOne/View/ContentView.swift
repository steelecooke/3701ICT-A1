//
//  ContentView.swift
//  AssignmentOne
//
//  Created by Steele Cooke on 19/3/2023.
//

import SwiftUI

/// The main application view that displays a checklist.
///
/// `ContentView` is responsible for displaying the `CheckListView` with the associated list items.
/// - Examples:
///     ```swift
///     ContentView()
///     ```
struct ContentView: View {
    
    var body: some View {
        CheckListCollectionView()
    }
}

/// A `PreviewProvider` for the `ContentView`.
///
/// The `ContentView_Previews` is used to generate SwiftUI previews for the `ContentView`.
struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        ContentView()
    }
}
