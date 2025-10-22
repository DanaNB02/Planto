import SwiftUI

struct PlantListView: View {

    @StateObject private var viewModel = PlantViewModel()
    @State private var isShowingAddPlantView = false
    @State private var selectedPlant: Plant?
    
    var body: some View {
        NavigationView {
            VStack{
                Rectangle()
                    .frame(height: 0.3)
                    .foregroundColor(Color.customDarkGray)
                    .padding(.top, 8)

            ZStack(alignment: .bottomTrailing) {
                
                if viewModel.plants.isEmpty {
                    EmptyStateView(isShowingAddPlantView: $isShowingAddPlantView)
                    
                } else {
                    
                    // if progress is 1.0 (100%)
                    if viewModel.progressValue == 1.0 {
                        VStack(spacing: 16) {
                            Image("winky-planto")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 160, height: 200)

                            Text("All Done! 🎉")
                                .font(.title)
                                .fontWeight(.bold)
                            
                            Text("All Reminders Completed")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                                .multilineTextAlignment(.center)
                                .padding(.horizontal, 35)
                                .padding(10)
                        }
                        .padding(.top, -50)
                        .padding(.bottom, 70)
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        
                    } else {
                        
                        // Show both prgress bar & list
                        VStack(spacing: 0) {
                            
                            VStack(spacing: 8) {
                                Text(viewModel.progressValue == 0.0 ? "Your plants are waiting for a sip 💦" : "\(viewModel.completedPlantCount) of your plants feel loved today✨")
                                    .font(.headline)
                                    .fontWeight(.medium)
                                    .padding(.top, 15)
                                    .padding(.bottom, 10)
                                
                                ProgressView(value: viewModel.progressValue)
                                    .tint(Color.customeGreen)
                                    .scaleEffect(x: 1, y: 2, anchor: .center)
                                    .padding(.horizontal, 5)
                            }
                            .padding()

                            List {
                                ForEach(viewModel.sortedPlants) { plant in
                                    VStack(spacing: 0) {
                                        PlantRowView(
                                            plant: plant,
                                            onToggleComplete: {
                                                viewModel.toggleCompletion(plant)
                                            },
                                            onEdit: {
                                                selectedPlant = plant
                                            }
                                        )
                                        Divider()
                                            .background(Color.customDarkGray)
                                            .padding(.horizontal)
                                    }
                                    // to remove the defualt paddings.
                                    .listRowInsets(EdgeInsets())
                                    // to remove the default divider.
                                    .listRowSeparator(.hidden)
                                }
                                .onDelete(perform: viewModel.deletePlant)
                            }
                            .listStyle(.plain)
                                             
                        }
                    }
                    
                    Button {
                        isShowingAddPlantView = true
                    } label: {
                        Image(systemName: "plus")
                            .font(.title3)
                            .foregroundColor(.white)
                            .padding(.vertical, 15)
                            .padding(.horizontal, 10)
                    
                    }
                    .buttonStyle(.glass)
                    .controlSize(.regular)
                    .padding(.horizontal, 25)
                    .padding(.vertical, 20)
                    
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

#Preview {
    PlantListView()
}
