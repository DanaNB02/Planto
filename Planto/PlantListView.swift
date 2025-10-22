import SwiftUI

struct PlantListView: View {

    @StateObject private var viewModel = PlantViewModel()
    @State private var isShowingAddPlantView = false
    @State private var selectedPlant: Plant?
    
    var body: some View {
        NavigationView {
            ZStack(alignment: .bottomTrailing) {

                if viewModel.plants.isEmpty {
                    EmptyStateView(isShowingAddPlantView: $isShowingAddPlantView)
                               
                } else {
                
                // if progress is 1.0 (100%)
                if viewModel.progressValue == 1.0 {
                    // Show the "All Done" view
                    VStack(spacing: 16) {
                        Image("winky-planto")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 150, height: 150)
                        
                        Text("All Done! 🎉")
                            .font(.title)
                            .fontWeight(.bold)
                        Text("All Reminders Completed")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    
                } else {
                    
                    // Show both prgress bar & list
                    VStack(spacing: 0) {
                        
                        VStack(spacing: 8) {
                            Text(viewModel.progressValue == 0.0 ? "Your plants are waiting for a sip 💦" : "\(viewModel.completedPlantCount) of your plants feel loved today✨")
                                .font(.headline)
                                .fontWeight(.medium)
                            
                            ProgressView(value: viewModel.progressValue)
                                .tint(.green)
                        }
                        .padding()
                        
                        List {
                            ForEach(viewModel.sortedPlants) { plant in
                                HStack {
                                    Button(action: {
                                        selectedPlant = plant
                                    }) {
                                        VStack(alignment: .leading) {
                                            Text(plant.name)
                                                .fontWeight(.bold)
                                            Text("Room: \(plant.room)")
                                            Text("Light: \(plant.light)")
                                            Text("Water: \(plant.water_amount) every \(plant.watering_days)")
                                        }
                                        .foregroundColor(plant.isCompleted ? .gray : .primary)
                                    }
                                    
                                    .disabled(plant.isCompleted)
                                    Spacer()
                                    
                                    Button(action: {
                                        viewModel.toggleCompletion(plant)
                                    }) {
                                        Image(systemName: plant.isCompleted ? "checkmark.circle.fill" : "circle")
                                            .font(.title2)
                                            .foregroundColor(plant.isCompleted ? .green : .gray)
                                    }
                                    .buttonStyle(.borderless)
                                }
                                .strikethrough(plant.isCompleted, color: .gray)
                            }
                            .onDelete(perform: viewModel.deletePlant)
                        }
                    }
                }
                
                Button(action: {
                    isShowingAddPlantView = true
                }) {
                    
                    Image(systemName: "plus.circle.fill")
                        .resizable()
                        .frame(width: 56, height: 56)
                        .foregroundColor(Color(red: 0.4, green: 0.8, blue: 0.6))
                        .padding()
                }
            }
            
        }
            .navigationTitle("My Plants 🌱")
            // add reminder sheet
            .sheet(isPresented: $isShowingAddPlantView) {
                PlantEditorView(viewModel: viewModel)
            }
            // edit reminder sheet
            .sheet(item: $selectedPlant) { plant in
                PlantEditorView(viewModel: viewModel, plantToUpdate: plant)
            }
        }
    }
}
