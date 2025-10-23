import Foundation

struct Plant: Identifiable, Codable {
    let id: UUID
    var name: String
    var room: String
    var light: String
    var watering_days: String
    var water_amount: String
    var isCompleted: Bool = false

    init(id: UUID = UUID(), name: String, room: String, light: String, watering_days: String, water_amount: String, isCompleted: Bool = false) {
        self.id = id
        self.name = name
        self.room = room
        self.light = light
        self.watering_days = watering_days
        self.water_amount = water_amount
        self.isCompleted = isCompleted
    }
}
