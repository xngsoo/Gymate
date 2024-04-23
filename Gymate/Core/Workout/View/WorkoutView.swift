//
//  WorkoutView.swift
//  Gymate
//
//  Created by Han on 4/23/24.
//

import SwiftUI

struct WorkoutView: View {
    
    @State private var workouts: [Workout] = []
    @State private var showAddWorkout = false
    @ObservedObject var viewmodel: WorkoutViewModel = WorkoutViewModel(service: WorkoutService())
    
    var body: some View {
        NavigationStack {
            
            // 추가된 운동이 없을 때
            if viewmodel.workouts.isEmpty {
                ZStack(alignment: .bottomTrailing) {
                    Text("운동이 없어요")
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        //.background(.blue)
                        .padding()
                        .navigationTitle("오늘의 운동")
                    Button {
                        showAddWorkout.toggle()
                    } label: {
                        Image(systemName: "plus")
                            .font(.subheadline)
                            .foregroundStyle(.white)
                            .fontWeight(.semibold)
                            .frame(width: 100, height: 64)
                            .background(.pink)
                            .clipShape(Circle())
                    }
                    .padding()
                }
                .sheet(isPresented: $showAddWorkout, content: {
                    AddWorkoutView()
                })
            } else { // 추가된 운동이 있을 때
                ZStack(alignment: .bottomTrailing) {
                    ScrollView {
                        WorkoutListView()
                    }
                    .padding()
                    .navigationTitle("오늘의 운동")
                    
                    NavigationLink {
                        OnWorkoutView()
                            .navigationBarBackButtonHidden()
                    } label: {
                        Text("Start!")
                            .font(.subheadline)
                            .foregroundStyle(.white)
                            .fontWeight(.semibold)
                            .frame(width: 100, height: 64)
                            .background(.pink)
                            .clipShape(Circle())
                    }
                    .padding()
                }
            }
        }
    }
}

#Preview {
    WorkoutView(viewmodel: WorkoutViewModel(service: WorkoutService()))
}
