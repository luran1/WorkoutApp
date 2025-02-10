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
    var body: some View {
        Form{
            TextField("Routine Name", text: $name)
            Section{
                ForEach($newWorkout){ exercise in
                    VStack(alignment: .leading){
                        Text(exercise.wrappedValue.name)
                        TextField("Notes", text: exercise.notes, axis: .vertical)
                            .lineLimit(1...3)
                        HStack(alignment: .center, spacing: 22){
                            Spacer()
                            VStack{
                                Text("Set")
                                Text("\(1)")
                            }
                            
                            VStack{
                                Text("Weight")
                                Text("\(100)")
                            }
                            VStack{
                                Text("Reps")
                                Text("\(10)")
                            }
                            Spacer()
                        }
                    }
                    
                }
            }
            
        }
        .navigationTitle(name)
    }
}

#Preview {
    AddNewWorkoutRoutineView(newWorkout: [Exercise(name: "push-Ups")])
}
