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
            Section {
                TextField("e.g., Pothos", text: $name) {
                    Text("Plant Name")
                }
            }
            
//            TextField(text: $name) {
//                Label("Plant Name", systemImage: "pencil")
//                    .foregroundColor(.white
//            }
            Section {
                Picker(selection: $selectedRoom) {
                    ForEach(roomOptions, id: \.self) { Text($0) }
                } label: {
                    Label("Room", systemImage: "paperplane")
                        .foregroundColor(.white)
                }
                Picker(selection: $selectedLight) {
                    ForEach(lightOptions, id: \.self) { Text($0) }
                } label: {
                    Label("Light", systemImage: "sun.max")
                        .foregroundColor(.white)
                }
            }
            
            Section {
                Picker(selection: $selectedWatering) {
                    ForEach(wateringOptions, id: \.self) { Text($0) }
                } label: {
                    Label("Watering Days", systemImage: "drop")
                        .foregroundColor(.white)
                }
                
                Picker(selection: $selectedAmount) {
                    ForEach(amountOptions, id: \.self) { Text($0) }
                } label: {
                    Label("Water", systemImage: "drop")
                        .foregroundColor(.white)
                }
            }
        }
    }
}

