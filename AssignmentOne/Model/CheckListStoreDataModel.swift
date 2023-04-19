//
//  CheckListStoreDataModel.swift
//  AssignmentOne
//
//  Created by Steele Cooke on 18/4/2023.
//

import Foundation

/// A class that manages the storage of checklists.
///
/// `ChecklistStore` is an `ObservableObject` that handles the loading and saving of checklists in the user's device.
/// When the `checkLists` array is modified, the data is automatically saved to the device storage.
///
/// - Variables:
///     - checkLists: [CheckList] - An array of `CheckList` objects representing all checklists in the app.
///
/// - Examples:
/// ```swift
/// @StateObject var viewModel = CheckListCollectionViewModel()
/// ```
class ChecklistStore: ObservableObject {
    @Published var checkLists: [CheckList] = [] {
        didSet {
            Task {
                do {
                    try await save(checklists: checkLists)
                } catch {
                    print("Error saving checklists: \(error)")
                }
            }
        }
    }

    /// Returns a local file URL `checklists.data` for the load and save functions to use.
    private static func fileURL() throws -> URL {
        try FileManager.default.url(for: .documentDirectory,
                                     in: .userDomainMask,
                                     appropriateFor: nil,
                                     create: false)
            .appendingPathComponent("checklists.data")
    }

    /// Loads checklists from the device storage.
    ///
    /// Reads the saved checklists data and decodes it into a `[CheckList]` array.
    /// If there is no data, it does not modify the `checkLists` array.
    func load() async throws {
        let fileURL = try Self.fileURL()
        guard let data = try? Data(contentsOf: fileURL) else {
            return
        }
        self.checkLists = try JSONDecoder().decode([CheckList].self, from: data)
    }
    
    /// Saves checklists to the device storage.
    ///
    /// Encodes the provided `[CheckList]` array into data and writes it to the device storage.
    ///
    /// - Parameters:
    ///     - checklists: [CheckList] - An array of `CheckList` objects to be saved.
    func save(checklists: [CheckList]) async throws {
        let data = try JSONEncoder().encode(checklists)
        let fileURL = try Self.fileURL()
        try data.write(to: fileURL)
    }
}
