import SwiftUI

struct PlantListView: View {

    @StateObject private var viewModel = PlantViewModel()
    
    @State private var isShowingAddPlantView = false
    
    @State private var selectedPlant: Plant?
    
    var body: some View {
        NavigationView {
            ZStack(alignment: .bottomTrailing) {
                List {
                    ForEach(viewModel.plants) { plant in
                        Button(action: {
                            // When tapped, store the selected plant and show the sheet.
                            selectedPlant = plant
                        }) {
                            VStack(alignment: .leading) {
                                Text(plant.name)
                                    .fontWeight(.bold)
                                Text("Room: \(plant.room)")
                                Text("Light: \(plant.light)")
                                Text("Water: \(plant.water_amount) every \(plant.watering_days)")
                            }
                            .foregroundColor(.primary)
                        }
                    }
                    .onDelete(perform: viewModel.deletePlant)
                }
                .navigationTitle("My Plants")
                
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
            // sheet for adding a new plant.
            .sheet(isPresented: $isShowingAddPlantView) {
                PlantEditorView(viewModel: viewModel)
            }
            // sheet for editing an existing plant.
            .sheet(item: $selectedPlant) { plant in
                PlantEditorView(viewModel: viewModel, plantToUpdate: plant)
            }
        }
    }
}
