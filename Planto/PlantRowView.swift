import SwiftUI

struct PlantRowView: View {
    let plant: Plant
    
    let onToggleComplete: () -> Void
    let onEdit: () -> Void
    
    var body: some View {
        HStack(spacing: 15) {
            Button(action: onToggleComplete) {
                Image(systemName: plant.isCompleted ? "checkmark.circle.fill" : "circle")
                    .font(.title2)
                    .foregroundColor(plant.isCompleted ? Color.customeGreen : .gray)
            }
            .buttonStyle(.borderless)
            
            Button(action: onEdit) {
                VStack(alignment: .leading, spacing: 6) {
                    Label("in \(plant.room)", systemImage: "paperplane")
                        .font(.caption)
                        .foregroundColor(Color(red: 255/255, green: 255/255, blue: 255/255, opacity: 0.5))
                    Text(plant.name)
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    
                    HStack(spacing: 8) {
                        BadgeView(icon: "sun.max", text: plant.light, color: Color.customeYellow)
                        BadgeView(icon: "drop", text: plant.water_amount, color: Color.customeBlue)
                    }
                }
            }
            .buttonStyle(.plain)
            .disabled(plant.isCompleted)
            
            Spacer()
        }
        .padding(.vertical, 12)
        .padding(.horizontal)
    }
}

struct BadgeView: View {
    let icon: String
    let text: String
    let color: Color
    
    var body: some View {
        HStack(spacing: 4) {
            Image(systemName: icon)
            Text(text)
        }
        .font(.caption)
        .padding(.horizontal, 8) 
        .padding(.vertical, 4)
        .background(Color(red: 24/255, green: 24/255, blue: 29/255))
        .clipShape(Capsule())
        .foregroundColor(color)
    }
}
