//
//  ListVM.swift
//  PleaseDo
//
//  Created by Anxhelo Kermezo on 18/2/25.
//

import Foundation

final class ListVM: ObservableObject {
    @Published var todoItems: [Item] = [
        Item(id: "abc123", authorId: "John Doe", title: "First item", description: "First Description", startDate: .now, status: .todo, priority: .low),
        Item(id: "123abc", authorId: "John Doe", title: "Second item", description: "Second Description", startDate: .now, status: .inProgress, priority: .medium),
        Item(id: "qwe123", authorId: "John Doe", title: "Third item", description: "Third Description", startDate: .now + 5, status: .done, priority: .high),
    ]
    
    @Published var inPorgressItems: [Item] = [
        Item(id: "abc123", authorId: "John Doe", title: "First item", description: "First Description", startDate: .now, status: .todo, priority: .low),
        Item(id: "123abc", authorId: "John Doe", title: "Second item", description: "Second Description", startDate: .now, status: .inProgress, priority: .medium),
        Item(id: "qwe123", authorId: "John Doe", title: "Third item", description: "Third Description", startDate: .now + 10, status: .done, priority: .high),
    ]
    
    @Published var doneItems: [Item] = [
        Item(id: "abc123", authorId: "John Doe", title: "First item", description: "First Description", startDate: .now, status: .todo, priority: .low),
        Item(id: "123abc", authorId: "John Doe", title: "Second item", description: "Second Description", startDate: .now, status: .inProgress, priority: .medium),
        Item(id: "qwe123", authorId: "John Doe", title: "Third item", description: "Third Description", startDate: .now + 10, status: .done, priority: .high),
    ]
    
    @Published var unknown: [Item] = []
    
    func fetchItems() {
        IM.shared.fetchItems()
    }
}
