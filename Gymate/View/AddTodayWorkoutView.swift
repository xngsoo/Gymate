//
//  AddTodayWorkView.swift
//  Gymate
//
//  Created by Han on 4/1/24.
//

import SwiftUI

enum Field {
    case workoutName
    case repsPerSet
    case totalSet
}

struct AddTodayWorkoutView: View {
    @Environment(\.presentationMode) var presentation
    @State private var workoutName = ""
    @State private var totalSet = ""
    @State private var repsPerSet = ""
    @State private var todayWorkouts: [WorkOut] = []
    @State var wrongAttempt: Bool = false
    @State var attempts: Int = 0
    @FocusState private var focusField: Field?
    
    var body: some View {
        VStack {
            
            //MARK: - sheet뷰 상단 NavigationBar
            HStack {
                Button {
                    presentation.wrappedValue.dismiss()
                } label: {
                    Text("취소")
                }
                Spacer()
                Button {
                    //add today workout
                } label: {
                    Text("등록")
                }
            }
            .padding()
            //HStack
            
            //MARK: todayWorkouts ListView
            if todayWorkouts.isEmpty {
                Spacer()
                ZStack {
                    Rectangle().foregroundStyle(.black)
                        //.frame(width: .infinity, height: .infinity)
                    Text("오늘의 운동이 없어요!")
                        .foregroundStyle(.white)
                }
                .onTapGesture {
                    hideKeyboard()
                }
                Spacer()
            } else {
                //add된 workouts list
                List (todayWorkouts) { workout in
                    Text("\(workout.workoutName) \(workout.repsPerSet)개 \(workout.totalSet)세트")
                }
                .onTapGesture {
                    hideKeyboard()
                }
            }
            
            Spacer()
            TextField("추가할 운동을 입력하세요", text: $workoutName)
                .textFieldStyle(CommonTextFieldStyle())
                .focused($focusField, equals: .workoutName)
                .padding()
                .onSubmit {
                    focusField = .repsPerSet
                }
            HStack {
                TextField("", text: $repsPerSet)
                    .textFieldStyle(CommonTextFieldStyle())
                    .focused($focusField, equals: .repsPerSet)
                    .keyboardType(.numberPad)
                    .onSubmit {
                        focusField = .totalSet
                    }
                Text("개")
                TextField("", text: $totalSet)
                    .textFieldStyle(CommonTextFieldStyle())
                    .focused($focusField, equals: .totalSet)
                    .keyboardType(.numberPad)
                    .onSubmit {
                        focusField = nil
                    }
                Text("세트")
            }
            .padding(.horizontal)
            
            //MARK: - Add 버튼
            Button{
                if workoutName.isEmpty {
                    withAnimation(.default) {
                        self.attempts += 1
                    }
                    focusField = .workoutName
                } else if repsPerSet.isEmpty {
                    withAnimation(.default) {
                        self.attempts += 1
                    }
                    focusField = .repsPerSet
                } else if totalSet.isEmpty {
                    withAnimation(.default) {
                        self.attempts += 1
                    }
                    focusField = .totalSet
                } else {
                    focusField = nil
                    addTodayWorkout()
                }
            } label: {
                ZStack {
                    RoundedRectangle(cornerRadius: 8)
                        .frame(height: 50)
                    Text("Add")
                        .foregroundStyle(.white)
                }
                .padding()
            }
            .modifier(Shake(animatableData: CGFloat(attempts)))
        }
    }
    
    // Textfield empty check 함수
    private func checkTextField() {
        if workoutName.isEmpty {
            focusField = .workoutName
        } else if repsPerSet.isEmpty {
            focusField = .repsPerSet
        } else if totalSet.isEmpty {
            focusField = .totalSet
        } else {
            focusField = nil
        }
    }
    //Add 버튼 action 함수
    func addTodayWorkout() {
        todayWorkouts.append(WorkOut(workoutName: workoutName,
                                     repsPerSet: Int(repsPerSet) ?? 0,
                                     totalSet: Int(totalSet) ?? 0
                                    ))
        
        workoutName = ""
        repsPerSet = ""
        totalSet = ""
    }
}

struct Shake: GeometryEffect {
    var amount: CGFloat = 10
    var shakesPerUnit = 3
    var animatableData: CGFloat
    
    func effectValue(size: CGSize) -> ProjectionTransform {
        ProjectionTransform(CGAffineTransform(translationX:
                                                amount * sin(animatableData * .pi * CGFloat(shakesPerUnit)),
                                              y: 0))
    }
}

#Preview {
    AddTodayWorkoutView()
}
