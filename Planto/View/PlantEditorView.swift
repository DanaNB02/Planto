import SwiftUI

struct PlantEditorView: View {
    @Environment(\.dismiss) var dismiss
    @ObservedObject var viewModel: PlantViewModel
    
    let plantToUpdate: Plant?

    @State private var name: String
    @State private var selectedRoom: String
    @State private var selectedLight: String
    @State private var selectedWatering: String
    @State private var selectedAmount: String
    
    // show/hide the alert.
    @State private var isShowingDeleteAlert = false

    init(viewModel: PlantViewModel, plantToUpdate: Plant? = nil) {
        self.viewModel = viewModel
        self.plantToUpdate = plantToUpdate
        
        _name = State(initialValue: plantToUpdate?.name ?? "")
        _selectedRoom = State(initialValue: plantToUpdate?.room ?? "Living Room")
        _selectedLight = State(initialValue: plantToUpdate?.light ?? "Partial Sun")
        _selectedWatering = State(initialValue: plantToUpdate?.watering_days ?? "Every 7 days")
        _selectedAmount = State(initialValue: plantToUpdate?.water_amount ?? "100-200 ml")
    }
    
    var body: some View {
        NavigationView {
                    VStack(spacing: 0) {
                        PlantFormView(
                            name: $name,
                            selectedRoom: $selectedRoom,
                            selectedLight: $selectedLight,
                            selectedWatering: $selectedWatering,
                            selectedAmount: $selectedAmount
                        )

                        if plantToUpdate != nil {
                            GlassEffectContainer{
                                Button("Delete Reminder", role: .destructive) {
                                    isShowingDeleteAlert = true
                                }
                                .font(.headline.weight(.semibold))
                                .padding(.horizontal, 100)
                                .padding(.vertical, 12)
                                .background(Color(white: 0.15))
                                .cornerRadius(50)
                             
                            }
                            .glassEffect()
                            .padding(.bottom, 230)
                            
                        }
                    }
                    .padding(.horizontal, 10)
                    .navigationTitle(plantToUpdate == nil ? "Set Reminder" : "Edit Reminder")
                    .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                      ToolbarItem(placement: .navigationBarLeading) {
                          Button {
                              dismiss()
                          } label: {
                              Image(systemName: "xmark")
                                  .font(.body)
                                  .foregroundColor(.white)
                          }
                      }
                      ToolbarItem(placement: .navigationBarTrailing) {
                          Button {
                              savePlant()
                              dismiss()
                          } label: {
                              Image(systemName: "checkmark")
                                  .font(.body)
                                  .foregroundColor(.white)
                          }
                          .buttonStyle(.borderedProminent)
                          .tint(Color.customeGreen.opacity(0.7))

                          .disabled(name.isEmpty)
                      }
                  }
            
            // 'plant' is a temporary var for the data in presenting parameter - to send id & customize msg
            .alert("Delete Plant?", isPresented: $isShowingDeleteAlert, presenting: plantToUpdate) { plant in
                // performs the actual deletion.
                Button("Delete", role: .destructive) {
                    viewModel.deletePlant(with: plant.id)
                    dismiss()
                }
                // close the alert
                Button("Cancel", role: .cancel) {}
            } message: { plant in
                Text("Are you sure you want to delete \(plant.name)? This cannot be undone.")
            }
        }
    }

    // only to decide if we should call add or update.
    private func savePlant() {
        if let plantToUpdate = plantToUpdate {
            let updatedPlant = Plant(id: plantToUpdate.id, name: name, room: selectedRoom, light: selectedLight, watering_days: selectedWatering, water_amount: selectedAmount)
            viewModel.updatePlant(updatedPlant)
        } else {
            viewModel.addPlant(name: name, room: selectedRoom, light: selectedLight, wateringDays: selectedWatering, waterAmount: selectedAmount)
        }
    }
}


#Preview("Create Reminder") {
    let vm = PlantViewModel()
    return PlantEditorView(viewModel: vm, plantToUpdate: nil)
}

#Preview("Edit Reminder") {
    let vm = PlantViewModel()
    let samplePlant = Plant(name: "Monstera", room: "Living Room", light: "Partial Sun", watering_days: "Every 7 days", water_amount: "200-300 ml")
    vm.plants = [samplePlant]
    return PlantEditorView(viewModel: vm, plantToUpdate: samplePlant)
}
