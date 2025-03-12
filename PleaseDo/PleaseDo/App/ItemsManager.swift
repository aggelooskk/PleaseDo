//
//  ItemsManager.swift
//  PleaseDo
//
//  Created by Anxhelo Kermezo on 12/3/25.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

typealias IM = ItemsManager
final class ItemsManager {
    static let shared = ItemsManager()
    private init() {}
    
    private let db = Firestore.firestore()
    
    func fetchItems() {
        guard let currentUser = Auth.auth().currentUser else { return }
        let id = currentUser.uid
        
        db.collection("Items").whereField("authorId", isEqualTo: id)
          .addSnapshotListener { snapshot, err in
              if let err {
                  print("Error fetching documents: \(err)")
                  return
              }
              guard let snapshot else { return }
              snapshot.documentChanges.forEach { diff in
                  let data = diff.document.data()
                  let item = Item(data: data)
                  
                  switch diff.type {
                  case .added:
                      
                  case .modified:
                      
                  case .removed:
                }
            }
        }
    }
}
