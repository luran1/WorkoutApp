//
//  AddNewWorkoutRoutineView.swift
//  Workout
//
//  Created by Madison Francis on 2/7/25.
//

import SwiftUI


struct AddNewWorkoutRoutineView: View {
    @State var newWorkout: [Exercise]
    @State private var name = "Routine Name"
    @Binding var path: NavigationPath
    @FocusState private var IsFocused: Bool
    var body: some View {
        Form{
            TextField("Routine Name", text: $name)
            Section{
                ForEach(newWorkout.indices, id: \.self){ exercise in
                    Section(header: Text(newWorkout[exercise].name)){
                        Stepper(value: $newWorkout[exercise].restTimer, in: 0...180, step: 5) {
                                        Text("Rest Time: \(Int(newWorkout[exercise].restTimer)) seconds")
                                    }
                        TextField("Notes", text: $newWorkout[exercise].notes, axis: .vertical)
                            .lineLimit(1...2)
                        HStack(spacing: 30){
                            Spacer()
                            VStack(alignment: .center){
                                Text("Set")
                                ForEach(newWorkout[exercise].sets.indices, id: \.self){ setIndex in
                                    Text("\(setIndex+1)")
                                }
                            }
                            VStack(alignment: .center){
                                Text("Weight")
                                ForEach(newWorkout[exercise].sets.indices, id: \.self){ setIndex in
                                    TextField(String(format: "%0.1f", newWorkout[exercise].sets[setIndex].weight), value: $newWorkout[exercise].sets[setIndex].weight, format: .number)
                                        .keyboardType(.decimalPad)
                                        .focused($IsFocused)
                                }
                            }
                            VStack(alignment: .center){
                                Text("Reps")
                                ForEach(newWorkout[exercise].sets.indices, id: \.self){ setIndex in
                                    TextField("\(newWorkout[exercise].sets[setIndex].reps)", value: $newWorkout[exercise].sets[setIndex].reps, format: .number)
                                        .keyboardType(.numberPad)
                                        .focused($IsFocused)
                                }
                            }
                            Spacer()
                        }
                        Button{
                            newWorkout[exercise].sets.append(ExerciseSet())
                            print(newWorkout[exercise].sets.count)
                        } label: {
                            Label("Add new set", systemImage: "plus")
                        }
                    }
                }
            }
        }
        .toolbar{
            ToolbarItemGroup(placement: .keyboard){
                Button("Done"){
                    IsFocused = false
                }
            }
            ToolbarItem(placement: .confirmationAction){
                Button("Save"){
                    print(path.isEmpty)
                    path = NavigationPath()
                    print(path.isEmpty)
                }
            }
        }
        .navigationTitle(name)
    }
        
}

#Preview {
//    struct MyPreview: View {
//        @State var path = NavigationPath()
//        var body: some View {
//            AddNewWorkoutRoutineView(newWorkout: [Exercise.benchPress,Exercise.bicepCurl], path: $path)
//        }
//    }
//    return MyPreview()
//    AddNewWorkoutRoutineView(newWorkout: [Exercise.benchPress,Exercise.bicepCurl])
}
