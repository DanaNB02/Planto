import SwiftUI
import UserNotifications

@main
struct PlantoApp: App {
    var body: some Scene {
        WindowGroup {
            PlantListView()
                .preferredColorScheme(.dark)
                .onAppear {
                    requestNotificationPermission()
                }
        }
    }
    
    func requestNotificationPermission() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
            if success {
                print("Notification permission granted.")
                scheduleTestNotification()
            } else if let error {
                print("Error requesting notification permission: \(error.localizedDescription)")
            }
        }
    }
    
    func scheduleTestNotification() {
        let content = UNMutableNotificationContent()
        content.title = "Planto"
        content.subtitle = "Hey! let’s water your plant. 🌱"
        content.sound = UNNotificationSound.default

        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 30, repeats: false)

        let request = UNNotificationRequest(identifier: "plantoTestNotification", content: content, trigger: trigger)

        UNUserNotificationCenter.current().add(request) { error in
            if let error {
                print("Error scheduling notification: \(error.localizedDescription)")
            } else {
                print("Test notification scheduled successfully!")
            }
        }
    }
}

