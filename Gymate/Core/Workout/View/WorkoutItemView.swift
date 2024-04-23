//
//  WorkoutRowView.swift
//  Gymate
//
//  Created by Han on 4/23/24.
//

import SwiftUI

struct WorkoutItemView: View {
    
    let name: String
    let reps: Int
    let set: Int
    let index: Int
    let finishedWorkout: Bool
    
    var body: some View {
        HStack {
            
            // 운동 이름, 세트
            VStack(alignment: .leading, spacing: 7) {
                Text(name)
                    .font(.title2)
                    .fontWeight(.semibold)
                .foregroundStyle(.black) // 운동완료하면 색상 반전(흰색으로)
                
                HStack {
                    Text("\(reps)개")
                    Text("X")
                    Text("\(set) Set")
                }
            }
            Spacer()
            
            // 운동 순서
            VStack(spacing: 7) {
                Text("#\(index)")
                    .font(.headline)
                    .fontWeight(.semibold)
                Image(systemName: "checkmark")
            }
        }
        .padding(.horizontal)
        .padding()
        .frame(maxWidth: .infinity)
        .background(.white) // 운동이 완료되면 백그라운드 색상 변경 필요!
        .overlay {
            RoundedRectangle(cornerRadius: 10)
                .stroke(lineWidth: 1)
                .foregroundStyle(.black)
        }
    }
}

#Preview {
    WorkoutItemView(name: "벤치", reps: 5, set: 3, index: 1, finishedWorkout: false)
}
