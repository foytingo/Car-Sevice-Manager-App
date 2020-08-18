//
//  FirestoreManager.swift
//  Car Sevice Manager App
//
//  Created by Murat Baykor on 18.08.2020.
//  Copyright © 2020 Murat Baykor. All rights reserved.
//

import Foundation
import Firebase

struct FirestoreManager {
    
    
    static func fetchUsers(completed: @escaping(Result<[User], Error>) -> Void) {
        var users: [User] = []
        
        Firestore.firestore().collection("users").getDocuments { (snapshot, error) in
            if let error = error {
                completed(.failure(error))
            } else {
                for document in snapshot!.documents {
                    let user = User(uid: document.documentID, dictionary: document.data())
                    users.append(user)
                }
                completed(.success(users))
            }
            
        }
    }
}
