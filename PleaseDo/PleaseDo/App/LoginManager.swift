//
//  LoginManager.swift
//  PleaseDo
//
//  Created by Anxhelo Kermezo on 24/2/25.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

final class LoginManager {
    // fetch login related data to pass to LoginVM
    
    private let db = Firestore.firestore()
    var currentUser: User?
    
    func signUp(_ fname: String, _ lname: String, _ email: String, _ pw: String) {
        Task {
            do {
                let result = try await Auth.auth().createUser(withEmail: email, password: pw)
                currentUser = result.user
                let id = result.user.uid
                try await db.collection("Users").document(id).setData([
                  "fname": fname,
                  "lname": lname,
                  "email": email,
                  "id": id
                ])
                print("Document succesfully written")
            } catch {
                print(error)
            }
        }
        
        
//        Auth.auth().createUser(withEmail: email, password: pw) { [weak self] result, error in
//            if let error {
//                print(error)
//                return
//            }
//            guard let self, let result else { return }
//            currentUser = result.user
//            let id = result.user.uid
//
//            Task { [weak self] in
//                guard let self else { return }
//                do {
//                  try await db.collection("Users").document(id).setData([
//                    "fname": fname,
//                    "lname": lname,
//                    "email": email,
//                    "id": id
//                  ])
//                  print("Document successfully written!")
//                } catch {
//                  print("Error writing document: \(error)")
//                }
//            }
//        }
//    }
//}
