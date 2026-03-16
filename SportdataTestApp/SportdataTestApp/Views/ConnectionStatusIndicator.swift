import SwiftUI

struct ConnectionStatusIndicator: View {
    
    let connectionState: VPNConnectionState
    
    var body: some View {
        VStack(spacing: 12) {
            ZStack {
                Circle()
                    .fill(indicatorColor.opacity(0.12))
                    .frame(width: 72, height: 72)
                
                if connectionState == .connecting {
                    ProgressView()
                        .controlSize(.regular)
                } else {
                    Image(systemName: statusIconName)
                        .font(.system(size: 28, weight: .medium))
                        .foregroundStyle(indicatorColor)
                }
            }
            .animation(.easeInOut(duration: 0.3), value: connectionState)
            
            VStack(spacing: 4) {
                Text(connectionState.rawValue)
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundStyle(Color(nsColor: .labelColor))
                
                Text(statusSubtitle)
                    .font(.callout)
                    .foregroundStyle(Color(nsColor: .secondaryLabelColor))
            }
        }
    }
    
    // MARK: - Computed Properties
    private var indicatorColor: Color {
        switch connectionState {
        case .disconnected:
            return Color(nsColor: .systemRed)
        case .connecting:
            return Color(nsColor: .systemOrange)
        case .connected:
            return Color(nsColor: .systemGreen)
        }
    }
    
    private var statusSubtitle: String {
        switch connectionState {
        case .disconnected: 
            return "Not Protected"
        case .connecting: 
            return "Establishing Connection…"
        case .connected: 
            return "Your Connection is Secure"
        }
    }
    
    private var statusIconName: String {
        switch connectionState {
        case .disconnected:
            return "shield.slash"
        case .connecting: 
            return ""
        case .connected: 
            return "checkmark.shield.fill"
        }
    }
    
}
