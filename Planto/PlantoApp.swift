
import SwiftUI

@main
struct PlantoApp: App {
    var body: some Scene {
        WindowGroup {
            PlantListView().preferredColorScheme(.dark).ignoresSafeArea(.all)

        }
    }
}
