//
//  MainView.swift
//  Gymate
//
//  Created by Han on 3/26/24.
//

import SwiftUI

struct ContentView: View {
    
    @AppStorage("isLoggedIn") private var isLoggedIn = false
    var body: some View {
        if isLoggedIn {
            //HomeView()
            TabView {
                HomeView()
                    .tabItem {
                        Label("Home", systemImage: "dumbbell")
                    }
                
            }
        } else {
            SignUpView()
        }
    }
}

#Preview {
    ContentView()
}
