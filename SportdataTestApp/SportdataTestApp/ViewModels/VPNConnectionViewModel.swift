import Combine
import SwiftUI

@MainActor
final class VPNConnectionViewModel: ObservableObject {
    
    @Published private(set) var connectionState: VPNConnectionState = .disconnected
    @Published var selectedServer: VPNServerInfo
    
    let availableServers: [VPNServerInfo] = VPNServerInfo.availableServers
    
    init() {
        selectedServer = VPNServerInfo.availableServers[0]
    }
    
    var isToggleActionAvailable: Bool {
        connectionState != .connecting
    }
    
    var toggleActionTitle: String {
        switch connectionState {
        case .disconnected: 
            return "Connect"
        case .connecting: 
            return "Connecting…"
        case .connected: 
            return "Disconnect"
        }
    }
    
    var isServerSelectionEnabled: Bool {
        connectionState == .disconnected
    }
    
    func performToggleAction() {
        switch connectionState {
        case .disconnected:
            connectionState = .connecting
            Task {
                try? await Task.sleep(for: .seconds(2))
                connectionState = .connected
            }
        case .connecting:
            break
        case .connected:
            connectionState = .disconnected
        }
    }
    
}
