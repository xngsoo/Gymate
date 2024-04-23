//
//  MockupPreview.swift
//  Gymate
//
//  Created by Han on 4/23/24.
//

import Foundation

class MockupPreview {
    
    static let shared = MockupPreview()
    
    var workouts: [Workout] = [
        .init(name: "벤치프레스", reps: 10, set: 3, index: 1, finishedWorkout: false),
        .init(name: "랫풀다운", reps: 15, set: 3, index: 2, finishedWorkout: false),
        .init(name: "시티드로우", reps: 5, set: 5, index: 3, finishedWorkout: false),
        .init(name: "레그레이즈", reps: 20, set: 3, index: 4, finishedWorkout: false),
        .init(name: "사이드레터럴", reps: 5, set: 5, index: 5, finishedWorkout: false),
    ]
}
