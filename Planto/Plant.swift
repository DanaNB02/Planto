import Foundation


// identifiable is a protocol in Swift that enforces types to include a unique identifier property.
struct Plant: Identifiable {
    let id = UUID()
    var name: String
    var room : String
    var light: String
    var watering_days: String
    var water_amount: String
}


