//
//  NewCheckListPopoverViewModel.swift
//  AssignmentOne
//
//  Created by Steele Cooke on 5/4/2023.
//

import Foundation

class NewCheckListPopoverViewModel: ObservableObject {

    func addEmptyCheckList(name: String, checkLists: [CheckList]) -> [CheckList] {
        let items: [ListItem] = []
        var lists = checkLists
        lists.append(CheckList(name: name, items: items))
        
        return lists
    }
}
