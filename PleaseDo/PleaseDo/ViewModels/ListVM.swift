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
    
    init() {
        IM.shared.delegate = self
    }
    
    func fetchItems() {
        IM.shared.fetchItems()
    }
}

extension ListVM: ItemsManagerDelegate {
    func didFetchBatchItems(_ items: [Status: [Item]]) {
        DispatchQueue.main.async { [weak self] in
            guard let self else { return }
            for status in items.keys {
                switch status {
                case .todo:
                    todoItems = items[status]!
                case .inProgress:
                    inPorgressItems = items[status]!
                case .done:
                    doneItems = items[status]!
                case .unknown:
                    continue
                }
            }
        }
    }
    
    func didAddItem(_ item: Item) {
        <#code#>
    }
    
    func didUpdateitem(_ item: Item) {
        <#code#>
    }
    
    func didDeleteItem(_ item: Item) {
        <#code#>
    }
}
