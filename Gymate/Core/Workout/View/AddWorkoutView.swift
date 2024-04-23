//
//  AddWorkoutView.swift
//  Gymate
//
//  Created by Han on 4/23/24.
//

import SwiftUI

struct AddWorkoutView: View {
    
    @Environment(\.dismiss) var dismiss
    @State private var name: String = ""
    @State private var reps: Int = 0
    @State private var set: Int = 0
    @State private var index: Int = 1
    @State private var workouts: [Workout] = []
    @ObservedObject var viewmodel = WorkoutViewModel(service: WorkoutService())
    
    var body: some View {
        VStack {
            if workouts.isEmpty {
                HStack {
                    Button {
                        dismiss()
                    } label: {
                        Text("취소")
                            .fontWeight(.semibold)
                            .foregroundStyle(.red)
                    }
                    Spacer()
                    Button {
                        viewmodel.workouts.append(Workout(name: name, reps: reps, set: set, index: index, finishedWorkout: false))
                    } label: {
                        Text("등록")
                            .foregroundStyle(.blue)
                    }
                }
                .padding()
                Text("추가된 운동이 없어요")
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            } else {
                HStack {
                    Button {
                        dismiss()
                    } label: {
                        Text("취소")
                            .fontWeight(.semibold)
                            .foregroundStyle(.red)
                    }
                    Spacer()
                    Button {
                        viewmodel.workouts = workouts
                        dismiss()
                    } label: {
                        Text("등록")
                            .foregroundStyle(.blue)
                    }
                }
                .padding()
                ScrollView {
                    ForEach(workouts, id: \.self) { workout in
                        WorkoutItemView(name: workout.name,
                                        reps: workout.reps,
                                        set: workout.set,
                                        index: workout.index,
                                        finishedWorkout: workout.finishedWorkout)
                        .onAppear {
                            withAnimation(.snappy) {}
                        }
                    }
                }
                .scrollIndicators(.hidden)
                .padding()
            }
            
            Divider()
            
            VStack(alignment: .leading) {
                HStack {
                    Text("운동")
                        .font(.headline)
                    TextField("", text: $name)
                        .font(.subheadline)
                        .frame(maxWidth: .infinity, maxHeight: 32)
                        .overlay {
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(lineWidth: 1.0)
                                .foregroundStyle(Color(.systemGray4))
                        }
                    Spacer()
                }
                HStack {
                    Text("개수")
                        .font(.headline)
                    Stepper {
                        Text("\(reps)")
                    } onIncrement: {
                        reps += 1
                    } onDecrement: {
                        guard reps > 0 else {return}
                        reps -= 1
                    }
                    
                    Text("세트")
                        .font(.headline)
                    Stepper {
                        Text("\(set)")
                    } onIncrement: {
                        set += 1
                    } onDecrement: {
                        guard set > 0 else {return}
                        set -= 1
                    }
                }
            }
            .padding()
            
            Button {
                workouts.append(Workout(name: name, reps: reps, set: set, index: index, finishedWorkout: false))
                index += 1
                
                name = ""
                reps = 0
                set = 0
                print(workouts)
            } label: {
                Text("Add")
                    .padding()
                    .font(.subheadline)
                    .foregroundStyle(.white)
                    .fontWeight(.semibold)
                    .frame(maxWidth: .infinity)
                    .background(.pink)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
            }
            .padding(.horizontal)
        }
        .padding(.vertical)
    }
}

#Preview {
    AddWorkoutView()
}
