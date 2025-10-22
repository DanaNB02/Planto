import SwiftUI

struct EmptyStateView: View {
    
    // connects to 'isShowingAddPlantView' in PlantListView
    @Binding var isShowingAddPlantView: Bool
    
    var body: some View {
        VStack(spacing: 16) {
            Image("planto-logo")
                .resizable()
                .scaledToFit()
                .frame(width: 150, height: 150)
            
            Text("Start your plant journey!")
                .font(.title)
                .fontWeight(.bold)
            
            Text("Now all your plants will be in one place and we will help you take care of them :)🪴")
                .font(.subheadline)
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
                .padding(.horizontal)
            
            Button(action: {
                isShowingAddPlantView = true
            }) {
                Text("Set Plant Reminder")
                    .fontWeight(.semibold)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(12)
            }
            .padding(.top)
            .padding(.horizontal, 40)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}
