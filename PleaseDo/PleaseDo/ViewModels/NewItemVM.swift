//
//  NewItemVM.swift
//  PleaseDo
//
//  Created by Anxhelo Kermezo on 17/3/25.
//

import Foundation
import FirebaseAuth

final class NewItemVM: @ObservableObject {
    
    @Published var newItem = Item.empty()
    @Published var saveItemError = false
    @Published var didSaveItem = false
    
    init() {
        guard let user = Auth.auth().currentUser else { return }
        newItem = Item(id: UUID().uuidString,
            authorId: user.uid,
            title: "",
            description: "",
            startDate: .now,
            status: .todo,
            priority: .low
        )
    }
    
    func saveNewItem() {
        Task {
            do {
                try await  IM.shared.save(newItem)
                didSaveItem = true
            } catch {
                saveItemError = true
            }
        }
    }
}
