import Foundation
import Combine
import SwiftUI

class PlantViewModel: ObservableObject {
    @Published var plants: [Plant] = []
    init() {
        // can delete later
        fetchPlants()
        
    }
    
    // sample data
    func fetchPlants() {
        let plant1 = Plant(name: "Monstera", room: "Living Room", light: "Partial Sun", watering_days: "Every 7 days", water_amount: "200-300 ml")
        let plant2 = Plant(name: "Snake Plant", room: "Bedroom", light: "Full Sun", watering_days: "Every 3 days", water_amount: "50-100 ml")
        let plant3 = Plant(name: "Pothos", room: "Kitchen", light: "Partial Sun", watering_days: "Every 10 days", water_amount: "100-200 ml")
        
        plants.append(plant1)
        plants.append(plant2)
        plants.append(plant3)

    }
    
    
    func addPlant(name: String, room: String, light: String, wateringDays: String, waterAmount: String) {
        let newPlant = Plant(name: name, room: room, light: light, watering_days: wateringDays, water_amount: waterAmount)
        plants.append(newPlant)
    }
    
    // for swipe-to-delete gesture
    func deletePlant(indexSet: IndexSet) {
        plants.remove(atOffsets: indexSet)
    }
    // for deletion inside the edit sheet
    func deletePlant(with id: UUID) {
        plants.removeAll { $0.id == id }
    }
    
    
    func updatePlant(_ plant: Plant) {
        if let index = plants.firstIndex(where: { $0.id == plant.id }) {
            plants[index] = plant
        }
    }
}
