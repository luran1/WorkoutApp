//
//  AddExerciseSelectionView.swift
//  Workout
//
//  Created by Madison Francis on 2/8/25.
//

import SwiftUI

struct AddExerciseSelectionView: View {
    @State private var ListOfExercises: [ExerciseListItem] = []
    @State private var ListOfSelectedExercises: [Exercise] = []
    let targetedMuscleGroups: [String] = [
        "Chest",
        "Back",
        "Shoulders",
        "Arms",
        "Legs",
        "Glutes",
        "Calves",
        "Core"
    ]
    var body: some View {
        List{
            ForEach(targetedMuscleGroups, id: \.self){ muscle in
                Section(muscle){
                    ForEach(ListOfExercises) { exercise in
                        if exercise.targetedMuscleGroup == muscle{
                            HStack{
                                Text(exercise.exercise)
                                    .onTapGesture {
                                        if !ListOfSelectedExercises.contains(where: {$0.name == exercise.exercise}){
                                            ListOfSelectedExercises.append(Exercise(name: exercise.exercise))
                                        } else {
                                            ListOfSelectedExercises.removeAll(where: {$0.name == exercise.exercise})
                                        }
                                    }
                                Spacer()
                                if ListOfSelectedExercises.contains(where: {$0.name == exercise.exercise}){
                                    Image(systemName: "figure")
                                }
                            }
                        }
                    }
                }
            }
        }
        .onAppear {
            loadList()
        }
        .toolbar{
            ToolbarItem(placement: .status){
                
            }
        }
    }
    func loadList(){
        guard let url = Bundle.main.url(forResource: "ExerciseList", withExtension: "json") else {
            print("File not found.")
            return
        }
        do{
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            let exerciseList = try decoder.decode(ExerciseListItems.self, from: data)
            ListOfExercises = exerciseList.exercises
        } catch {
            print("error in decoding data. \(error)")
        }
    }
}





#Preview {
    AddExerciseSelectionView()
}
