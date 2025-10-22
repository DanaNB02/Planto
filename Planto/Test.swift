import SwiftUI

struct Test: View {
    var body: some View {
        VStack {
            Text("First Item")
            Divider() // This will be a horizontal line
            Text("Second Item")
        }
    }
}


#Preview {
    Test()
}
