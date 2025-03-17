//
//  NewItemVM.swift
//  PleaseDo
//
//  Created by Anxhelo Kermezo on 17/3/25.
//

import Foundation

final class NewItemVM: @ObservableObject {
    
    @Published var newItem = Item.empty()
    
    func saveNewItem() async throws {
       try await  IM.shared.save(newItem)
    }
}
