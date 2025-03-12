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
          .addSnapshotListener { querySnapshot, error in
            guard let documents = querySnapshot?.documents else {
              print("Error fetching documents: \(error!)")
              return
            }
            let cities = documents.compactMap { $0["name"] }
            print("Current cities in CA: \(cities)")
          }
    }
}
