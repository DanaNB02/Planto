import SwiftUI

struct EmptyStateView: View {
    
    // connects to 'isShowingAddPlantView' in PlantListView
    @Binding var isShowingAddPlantView: Bool
    
    var body: some View {
        VStack(spacing: 16) {
            VStack{
                Image("planto-logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 160, height: 200)
                    .padding()
                
                Text("Start your plant journey!")
                    .font(.title)
                    .fontWeight(.bold)
                
                Text("Now all your plants will be in one place and we will help you take care of them :)🪴")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 35)
                    .padding(10)
            }
            .padding(.top, -50)
            .padding(.bottom, 70)
         
            GlassEffectContainer{
                Button ("Set Plant Reminder"){
                    isShowingAddPlantView = true
                }
                .foregroundColor(.white)
                .padding(.horizontal, 70)
                .padding(.vertical, 10)
            }
            .glassEffect(.regular.tint(Color.customeGreen.opacity(0.7)).interactive())
        
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}


  


#Preview{
    EmptyStateView(isShowingAddPlantView: Binding<Bool>(get: {false}, set: {_ in })).preferredColorScheme(.dark)
}
