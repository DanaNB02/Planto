import SwiftUI

struct AddPlantView: View {
    
    // This allows us to dismiss the sheet.
    @Environment(\.dismiss) var dismiss
    
    // receive the ViewModel from the PlantListView.
    @ObservedObject var viewModel: PlantViewModel
    
    @State private var name: String = ""
    @State private var selectedRoom: String = "Living Room"
    @State private var selectedLight: String = "Partial Sun"
    @State private var selectedWatering: String = "Every 7 days"
    @State private var selectedAmount: String = "100-200 ml"
    
    // Options for our Pickers.
    let roomOptions = ["Living Room", "Bedroom", "Kitchen", "Bathroom", "Balcony"]
    let lightOptions = ["Full Sun", "Partial Sun", "Low Light"]
    let wateringOptions = ["Every day", "Every 3 days", "Every 7 days", "Every 10 days"]
    let amountOptions = ["20-50 ml", "50-100 ml", "100-200 ml", "200-300 ml"]
    
    var body: some View {
        // Use a NavigationView to get a top bar for buttons.
        NavigationView {
            Form {
                Section(header: Text("Plant Details")) {
                    TextField("Plant Name (e.g., Monstera)", text: $name)
                }
                
                Section(header: Text("Care Details")) {
                    Picker("Room", selection: $selectedRoom) {
                        ForEach(roomOptions, id: \.self) {
                            Text($0)
                        }
                    }
                    
                    Picker("Light", selection: $selectedLight) {
                        ForEach(lightOptions, id: \.self) {
                            Text($0)
                        }
                    }
                    
                    Picker("Watering Days", selection: $selectedWatering) {
                        ForEach(wateringOptions, id: \.self) {
                            Text($0)
                        }
                    }
                    
                    Picker("Water Amount", selection: $selectedAmount) {
                        ForEach(amountOptions, id: \.self) {
                            Text($0)
                        }
                    }
                }
            }
            .navigationTitle("Set Reminder")
            .navigationBarTitleDisplayMode(.inline) // Makes the title smaller
            .toolbar {
                // Button on the left to cancel.
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        dismiss() // This closes the sheet.
                    }
                }
                
                // Button on the right to save.
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Save") {
                        // Call the ViewModel function to add the new plant.
                        viewModel.addPlant(
                            name: name,
                            room: selectedRoom,
                            light: selectedLight,
                            wateringDays: selectedWatering,
                            waterAmount: selectedAmount
                        )
                        dismiss() // This closes the sheet.
                    }
                    // Disable the save button if the name is empty.
                    .disabled(name.isEmpty)
                }
            }
        }
    }
}
