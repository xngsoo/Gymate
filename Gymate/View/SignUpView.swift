//
//  SignInView.swift
//  Gymate
//
//  Created by Han on 3/26/24.
//

import SwiftUI
import Firebase

struct SignUpView: View {
    
    @State private var nickname: String = ""
    @State private var errorMessage: String = ""
    @State private var isLoggedIn = false
    
    var body: some View {
        VStack {
            TextField("닉네임", text: $nickname)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
            Button("회원가입") {
                signUp()
            }
        }
        .onChange(of: isLoggedIn, perform: { value in
            if value {
                UserDefaults.standard.set(true, forKey: "isLoggedIn")
            }
        })
    }
    
    func signUp() {
        // Firebase 인증을 이용한 회원가입
        Auth.auth().createUser(withEmail: "\(nickname)@gymate.com", password: "dummyPassword") { (result, error) in
            if let error = error {
                errorMessage = "회원가입 에러: \(error.localizedDescription)"
            } else {
                // 회원가입 성공
                errorMessage = ""
                isLoggedIn = true
                
                //MARK: firestore User 컬렉션에 사용자 추가 함수
                if let uid = Auth.auth().currentUser?.uid {
                    let db = Firestore.firestore()
                    let userRef = db.collection("User").document(uid)
                    
                    // 사용자 document 추가
                    userRef.setData(["uid": uid, "nickname": nickname]) { error in
                        if let error = error {
                            print("Error adding Firestore: \(error.localizedDescription)")
                        } else {
                            print("User added to Firestore with UID: \(uid)")
                        }
                    }
                }
                print("회원가입 성공")
            }
        }
        Auth.auth().signIn(withEmail: "\(nickname)@gymate.com", password: "dummyPassword") { (result, error) in
            if let error = error {
                errorMessage = "로그인 에러: \(error.localizedDescription)"
            } else {
                //로그인 성공
                isLoggedIn = true
                print("로그인 성공")
                
            }
        }
        
        //Firebase uid생성시 firestore User 컬렉션에 도큐먼트 생성
        if let uid = Auth.auth().currentUser?.uid {
            let db = Firestore.firestore()
            let userRef = db.collection("User").document(uid)
            
            // 기존 사용자 document 업데이트 또는 추가
            userRef.setData(["uid": uid], merge: true) { error in
                if let error = error {
                    print("Error adding document: \(error.localizedDescription)")
                } else {
                    print("Document added to User Collection with UID: \(uid)")
                }
            }
        } else {
            print("User not authenticated.")
        }
    }
}

#Preview {
    SignUpView()
}

