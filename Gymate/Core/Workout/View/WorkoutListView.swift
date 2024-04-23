//
//  WorkoutListView.swift
//  Gymate
//
//  Created by Han on 4/23/24.
//

import SwiftUI

struct WorkoutListView: View {
    
    @ObservedObject var viewmodel = WorkoutViewModel(service: WorkoutService())
    
    var body: some View {
        VStack(spacing: 20) {
            ForEach(viewmodel.workouts, id: \.self) { workout in
                WorkoutItemView(name: workout.name, reps: workout.reps, set: workout.set, index: workout.index, finishedWorkout: workout.finishedWorkout)
            }
        }
    }
}

#Preview {
    WorkoutListView()
}
