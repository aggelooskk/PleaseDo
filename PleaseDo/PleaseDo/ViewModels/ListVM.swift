//
//  ListVM.swift
//  PleaseDo
//
//  Created by Anxhelo Kermezo on 18/2/25.
//

import Foundation

final class ListVM: ObservableObject {
    @Published var todoItems: [Item] = [
       
    ]
    
    @Published var inProgressItems: [Item] = [

    ]
    
    @Published var doneItems: [Item] = [
     
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
                    inProgressItems = items[status]!
                case .done:
                    doneItems = items[status]!
                case .unknown:
                    continue
                }
            }
        }
    }
    
    func didAddItem(_ item: Item) {
        moveItem(item)
    }
    
    func moveItem(_ item: Item) {
        DispatchQueue.main.async { [weak self] in
            guard let self else { return }
            switch item.status {
            case .todo:
                todoItems.append(item)
            case .inProgress:
                inProgressItems.append(item)
            case .done:
                doneItems.append(item)
            case .unknown:
                break
            }
        }
    }
    
    func didUpdateItem(_ item: Item) {
        DispatchQueue.main.async { [weak self] in
            guard let self else { return }
            
            if let i = todoItems.firstIndex(of: item) {
                if todoItems[i].status == item.status {
                    todoItems[i] = item
                } else {
                    todoItems.remove(at: i)
                    moveItem(item)
                }
            } else if let i = inProgressItems.firstIndex(of: item) {
                if inProgressItems[i].status == item.status {
                    inProgressItems[i] = item
                } else {
                    inProgressItems.remove(at: i)
                    moveItem(item)
                }
            } else if let i = doneItems.firstIndex(of: item) {
                if doneItems[i].status == item.status {
                    doneItems[i] = item
                } else {
                    doneItems.remove(at: i)
                    moveItem(item)
                }
            }
        }
    }
    
    func didDeleteItem(_ item: Item) {
        DispatchQueue.main.async { [weak self] in
            guard let self else { return }
            switch item.status {
            case .todo:
                if let i = todoItems.firstIndex(of: item) {
                    todoItems.remove(at: i)
                }
            case .inProgress:
                if let i = inProgressItems.firstIndex(of: item) {
                    inProgressItems.remove(at: i)
                }
            case .done:
                if let i = doneItems.firstIndex(of: item) {
                    doneItems.remove(at: i)
                }
            case .unknown:
                break
            }
        }
    }
}
