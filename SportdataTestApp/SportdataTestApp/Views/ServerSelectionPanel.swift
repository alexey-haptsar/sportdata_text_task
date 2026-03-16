import SwiftUI

struct ServerSelectionPanel: View {
    
    @Binding var selectedServer: VPNServerInfo
    let availableServers: [VPNServerInfo]
    let isEnabled: Bool
    
    var body: some View {
        HStack {
            Text("Server")
                .font(.headline)
                .foregroundStyle(Color(nsColor: .labelColor))

            Spacer()

            Picker("Server", selection: $selectedServer) {
                ForEach(availableServers) { server in
                    Text("\(server.countryFlag) \(server.displayName)")
                        .tag(server)
                }
            }
            .labelsHidden()
            .pickerStyle(.menu)
            .frame(width: 170)
            .disabled(!isEnabled)
        }
    }
    
}
