import Foundation
 import Combine
 import SwiftUI

class PlantViewModel: ObservableObject {
    @Published var plants: [Plant] = []
    init() {
        // can delete later
        fetchPlants()
        
    }
    
    func fetchPlants() {
        let plant1 = Plant(name: "Monstera", room: "Living Room", light: "Partial Sun", watering_days: "Every 7 days", water_amount: "250 ml")
        let plant2 = Plant(name: "Snake Plant", room: "Bedroom", light: "Full Sun", watering_days: "Every 3 days", water_amount: "100 ml")
        let plant3 = Plant(name: "Pothos", room: "Kitchen", light: "Partial Sun", watering_days: "Every 5 days", water_amount: "150 ml")
        
        plants.append(plant1)
        plants.append(plant2)
        plants.append(plant3)

    }
    
    
    func addPlant(name: String, room: String, light: String, wateringDays: String, waterAmount: String) {
            let newPlant = Plant(name: name, room: room, light: light, watering_days: wateringDays, water_amount: waterAmount)
            plants.append(newPlant)
        }
    
    func deletePlant(indexSet: IndexSet) {
            plants.remove(atOffsets: indexSet)
        }
    
    
    // TODO: add update plant func
}
