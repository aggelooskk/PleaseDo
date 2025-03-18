//
//  ItemDetailsVM.swift
//  PleaseDo
//
//  Created by Anxhelo Kermezo on 18/3/25.
//

import Foundation

final class ItemDetailsVM: ObservableObject {
    
    @Published var initialItem = Item.empty()
    @Published var updatedItem = Item(id: "abc123", authorId: "dsdfsa", title: "Test", description: "Test", startDate: .now, status: .todo, priority: .low)
}
