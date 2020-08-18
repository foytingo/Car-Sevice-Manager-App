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
    
    
    static func fetchCars(completed: @escaping(Result<[Car], Error>) -> Void) {
        var cars: [Car] = []
        
        Firestore.firestore().collection("cars").getDocuments { (snapshot, error) in
            if let error = error {
                completed(.failure(error))
            } else {
                for document in snapshot!.documents {
                    let car = Car(uid: UUID(uuidString: document.documentID)!, dictionary: document.data())
                    cars.append(car)
                }
                completed(.success(cars))
            }
        }
    }
    
    
    static func fetchAppointments(completed: @escaping(Result<[Appointment], Error>) -> Void) {
        var appointments: [Appointment] = []
        
        Firestore.firestore().collection("appointments").getDocuments { (snapshot, error) in
            if let error = error {
                completed(.failure(error))
            } else {
                for document in snapshot!.documents {
                    let appointment = Appointment(uid: UUID(uuidString: document.documentID)!, dictionary: document.data())
                    appointments.append(appointment)
                }
                completed(.success(appointments))
            }
        }
        
    }
    
    
}
