//
//  ItemsManager.swift
//  PleaseDo
//
//  Created by Anxhelo Kermezo on 12/3/25.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

protocol ItemsManagerDelegate where Self: ListVM {
    func didFetchBatchItems(_ items: [Status: [Item]])
    func didAddItem(_ item: Item)
    func didUpdateItem(_ item: Item)
    func didDeleteItem(_ item: Item)
}

typealias IM = ItemsManager
final class ItemsManager {
    static let shared = ItemsManager()
    private init() {}
    
    weak var delegate: ItemsManagerDelegate? 
    private let db = Firestore.firestore()
    private var listener: ListenerRegistration?
    
    private var isInitialFetch = true
    
    private var allItems: [Status: [String: Item]] = [
        .todo: [:],
        .inProgress: [:],
        .done: [:]
    ]
    
    deinit {
        removeListener()
    }
    
    private func removeListener () {
        listener?.remove()
        listener = nil
    }
    
    func fetchItems() {
        guard let currentUser = Auth.auth().currentUser else { return }
        let id = currentUser.uid
        removeListener()
        
        listener = db.collection("Items").whereField("authorId", isEqualTo: id)
          .addSnapshotListener { [weak self] snapshot, err in
              if let err {
                  print("Error fetching documents: \(err)")
                  return
              }
              guard let self, let snapshot else { return }
              snapshot.documentChanges.forEach { [weak self] diff in
                  guard let self else { return }
                  let data = diff.document.data()
                  let item = Item(data: data)
                  
                  switch diff.type {
                  case .added:
                      if isInitialFetch {
                          allItems[item.status]?[item.id] = item
                      } else {
                          delegate?.didAddItem(item)
                      }
                  case .modified:
                      delegate?.didUpdateItem(item)
                  case .removed:
                      delegate?.didDeleteItem(item)
                }
            }
              guard isInitialFetch else { return }
              sortBatchItems()
              isInitialFetch = false
        }
    }
    
    private func sortBatchItems() {
        var sortedItems: [Status: [Item]] = [:]
        allItems.keys.forEach { status in
            sortedItems[status] = allItems[status]?.values.sorted(by: {
                $0.startDate > $1.startDate
            })
        }
        delegate?.didFetchBatchItems(sortedItems)
    }
    
    func save(_ item: Item) async throws {
        do {
            try await db.collection("Items").document(item.id).setData(item.toObject())
            print("Document successfully written!")
        } catch {
            print("Error writing document: \(error)")
            throw error
        }
    }
}
