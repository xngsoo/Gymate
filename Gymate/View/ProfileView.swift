//
//  ProfileView.swift
//  Gymate
//
//  Created by Han on 4/1/24.
//

import SwiftUI
import Firebase

struct ProfileView: View {
    var body: some View {
        VStack {
            Button {
                deleteAccount()
            } label: {
                Text("계정탈퇴")
            }
        }
    }
    func deleteAccount() {
        
        guard let user = Auth.auth().currentUser else {return}
        let credential = EmailAuthProvider.credential(withEmail: user.email!, password: "dummyPassword")
        user.reauthenticate(with: credential) { authResult, error in
            if let error = error {
                print("재인증 에러: \(error.localizedDescription)")
            }
            // Firebase 인증을 이용한 계정 삭제
            user.delete { error in
                if let error = error {
                    print("계정 탈퇴 에러: \(error.localizedDescription)")
                } else {
                    // 계정 탈퇴 성공
                    UserDefaults.standard.set(false, forKey: "isLoggedIn")
                    print("계정 탈퇴 성공")
                }
            }
        }
    }
}



#Preview {
    ProfileView()
}
