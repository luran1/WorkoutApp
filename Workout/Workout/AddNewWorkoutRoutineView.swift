//
//  AddNewWorkoutRoutineView.swift
//  Workout
//
//  Created by Madison Francis on 2/7/25.
//

import SwiftUI


struct AddNewWorkoutRoutineView: View {
    @State private var newWorkout: [Exercise]=[]
    @State private var name = "Routine Name"
    var body: some View {
        Form{
            TextField("Routine Name", text: $name)
            Section{
                //add exercises
            }
            
        }
        .navigationTitle(name)
    }
}

#Preview {
    AddNewWorkoutRoutineView()
}
