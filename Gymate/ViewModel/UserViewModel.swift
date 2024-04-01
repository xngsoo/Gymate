//
//  UserViewModel.swift
//  Gymate
//
//  Created by Han on 4/1/24.
//

import Foundation
import FirebaseDatabase
import FirebaseDatabaseSwift

class UserViewModel: ObservableObject {
    @Published var user: [User] = []
    
    let ref: DatabaseReference? = Database.database().reference()
    
    private let encoder = JSONEncoder()
    private let decoder = JSONDecoder()
    
    func listenToRealtimeDatabase() {
        
    }
    func stopListening() {
        
    }
    func addNewUser() {
        
    }
    func deleteUser() {
        
    }
}
