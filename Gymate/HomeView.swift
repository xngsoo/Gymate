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
    
    var body: some View {
        Text("Home View")
        Button("계정 탈퇴") {
            deleteAccount()
        }
    }
    
    func deleteAccount() {
        // Firebase 인증을 이용한 계정 삭제
        guard let currentUser = Auth.auth().currentUser else { return }
        
        currentUser.delete { error in
            if let error = error {
                print("계정 탈퇴 에러: \(error.localizedDescription)")
            } else {
                // 계정 탈퇴 성공
                isLoggedIn = false
                print("계정 탈퇴 성공")
            }
        }
    }
}

#Preview {
    HomeView()
}
