//
//  CheckListStoreDataModel.swift
//  AssignmentOne
//
//  Created by Steele Cooke on 18/4/2023.
//

import Foundation

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

    private static func fileURL() throws -> URL {
        try FileManager.default.url(for: .documentDirectory,
                                     in: .userDomainMask,
                                     appropriateFor: nil,
                                     create: false)
            .appendingPathComponent("checklists.data")
    }
    
    func load() async throws {
        let fileURL = try Self.fileURL()
        guard let data = try? Data(contentsOf: fileURL) else {
            return
        }
        self.checkLists = try JSONDecoder().decode([CheckList].self, from: data)
    }
    
    func save(checklists: [CheckList]) async throws {
        let data = try JSONEncoder().encode(checklists)
        let fileURL = try Self.fileURL()
        try data.write(to: fileURL)
    }
}
