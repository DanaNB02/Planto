import Foundation

struct Plant: Identifiable {
    let id: UUID
    var name: String
    var room: String
    var light: String
    var watering_days: String
    var water_amount: String

    init(id: UUID = UUID(), name: String, room: String, light: String, watering_days: String, water_amount: String) {
        self.id = id
        self.name = name
        self.room = room
        self.light = light
        self.watering_days = watering_days
        self.water_amount = water_amount
    }
}
