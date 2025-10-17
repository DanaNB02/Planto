import SwiftUI

struct PlantListView: View {

    @StateObject private var viewModel = PlantViewModel()
    @State private var isShowingAddPlantView = false

    var body: some View {
        NavigationView {
            
            ZStack(alignment: .bottomTrailing) {
                
                List {
                    ForEach(viewModel.plants) { plant in
                        VStack(alignment: .leading) {
                            Text(plant.name)
                                .fontWeight(.bold)
                            Text("Room: \(plant.room)")
                            Text("Light: \(plant.light)")
                            Text("Water: \(plant.water_amount) every \(plant.watering_days)")
                        }
                    }
                    // when a user swipes to delete a row.
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
            // this is inside the NavigationView scope
            .sheet(isPresented: $isShowingAddPlantView) {
                AddPlantView(viewModel: viewModel)
            }
        }
    }
}

struct PlantListView_Previews: PreviewProvider {
    static var previews: some View {
        PlantListView()
    }
}
