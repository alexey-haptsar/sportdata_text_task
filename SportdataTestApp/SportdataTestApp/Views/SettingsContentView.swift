import SwiftUI

struct SettingsContentView: View {
    
    @State private var autoConnectOnLaunch = false
    @State private var showConnectionNotifications = true
    @State private var startAtLogin = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Settings")
                .font(.headline)
                .foregroundStyle(Color(nsColor: .labelColor))
            
            VStack(spacing: 12) {
                settingsToggleRow("Connect automatically on launch", isOn: $autoConnectOnLaunch)
                settingsToggleRow("Show connection notifications", isOn: $showConnectionNotifications)
                settingsToggleRow("Start at login", isOn: $startAtLogin)
            }
        }
        .padding(20)
        .frame(width: 320)
    }
    
    private func settingsToggleRow(_ title: String, isOn: Binding<Bool>) -> some View {
        HStack {
            Text(title)
                .foregroundStyle(Color(nsColor: .labelColor))
            Spacer()
            Toggle(title, isOn: isOn)
                .labelsHidden()
                .toggleStyle(.switch)
        }
    }
    
}
