//
//  HomeView.swift
//  Gymate
//
//  Created by Han on 3/26/24.
//

import SwiftUI
import Firebase

struct HomeView: View {
    
    @AppStorage("isLoggedIn") var isLoggedIn = true
    @State private var uid: String? = Auth.auth().currentUser?.uid
    @State private var user: String? = Auth.auth().currentUser?.email
    
    var body: some View {
        var userNickname = String((user?.split(separator: "@").first)!)
        VStack {
            Text("Home View")
            Text("환영합니다 \(userNickname)")
//            Button("계정 탈퇴") {
//                deleteAccount()
//            }
            
            if let uid = uid {
                Text("사용자 UID: \(uid)")
            }
            
        } //Vstack
    }
    
}

#Preview {
    HomeView()
}
