
import SwiftUI

struct PlantFormView: View {
    @Binding var name: String
    @Binding var selectedRoom: String
    @Binding var selectedLight: String
    @Binding var selectedWatering: String
    @Binding var selectedAmount: String

    // Options for the pickers
    let roomOptions = ["Living Room", "Bedroom", "Kitchen", "Bathroom", "Balcony"]
    let lightOptions = ["Full Sun", "Partial Sun", "Low Light"]
    let wateringOptions = ["Every day", "Every 3 days", "Every 7 days", "Every 10 days"]
    let amountOptions = ["20-50 ml", "50-100 ml", "100-200 ml", "200-300 ml"]
    
    var body: some View {
        Form {
            Section(header: Text("Plant Details")) {
                TextField("Plant Name (e.g., Monstera)", text: $name)
            }
            
            Section(header: Text("Care Details")) {
                Picker("Room", selection: $selectedRoom) {
                    ForEach(roomOptions, id: \.self) { Text($0) }
                }
                Picker("Light", selection: $selectedLight) {
                    ForEach(lightOptions, id: \.self) { Text($0) }
                }
                Picker("Watering Days", selection: $selectedWatering) {
                    ForEach(wateringOptions, id: \.self) { Text($0) }
                }
                Picker("Water Amount", selection: $selectedAmount) {
                    ForEach(amountOptions, id: \.self) { Text($0) }
                }
            }
        }
    }
}
