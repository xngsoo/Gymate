//
//  Workout.swift
//  Gymate
//
//  Created by Han on 4/23/24.
//

import Foundation

struct Workout: Hashable, Identifiable {
    
    var id = NSUUID().uuidString
    
    var name: String
    var reps: Int
    var set: Int
    var index: Int
    var finishedWorkout: Bool
    
    //var runningTime: Int // 각 운동의 러닝타임 type은 고려할 필요 (초로 계산할건데 time을 써야할지)
}
