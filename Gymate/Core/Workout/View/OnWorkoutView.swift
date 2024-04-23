//
//  OnWorkoutView.swift
//  Gymate
//
//  Created by Han on 4/23/24.
//

import SwiftUI
import Combine
import Foundation

struct OnWorkoutView: View {
    
    @ObservedObject var viewmodel = WorkoutViewModel(service: WorkoutService())
    @ObservedObject var myTimer = MyTimer()
    
    var body: some View {
        VStack(alignment: .center) {
            Text("운동 시작한지 ")
            HStack(alignment: .bottom) {
                Text(String(format: "%.1f", self.myTimer.value))
                    .font(.largeTitle)
                Text("초")
                    .font(.title)
            }
            Spacer()
            
            
        }
        .padding()
    }
}

#Preview {
    OnWorkoutView()
}
