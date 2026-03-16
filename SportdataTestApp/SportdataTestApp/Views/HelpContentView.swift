import SwiftUI

struct HelpContentView: View {
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Help")
                .font(.headline)
                .foregroundStyle(Color(nsColor: .labelColor))
            
            Text("This application provides a secure VPN connection to protect your online activity.")
                .font(.callout)
                .foregroundStyle(Color(nsColor: .secondaryLabelColor))
            
            Divider()
            
            VStack(alignment: .leading, spacing: 10) {
                helpEntry(title: "Connect", description: "Select a server and click Connect to establish a VPN connection.")
                helpEntry(title: "Disconnect", description: "Click Disconnect to end your active VPN session.")
                helpEntry(title: "Server Selection", description: "Choose from available server locations using the dropdown menu.")
            }
        }
        .padding(20)
        .frame(width: 300)
    }
    
    private func helpEntry(title: String, description: String) -> some View {
        VStack(alignment: .leading, spacing: 2) {
            Text(title)
                .font(.callout)
                .fontWeight(.medium)
                .foregroundStyle(Color(nsColor: .labelColor))
            Text(description)
                .font(.caption)
                .foregroundStyle(Color(nsColor: .secondaryLabelColor))
        }
    }
    
}
