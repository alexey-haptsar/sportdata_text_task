import SwiftUI

struct ConnectionToggleButton: View {
    
    let title: String
    let connectionState: VPNConnectionState
    let isEnabled: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.headline)
                .frame(maxWidth: .infinity)
                .padding(.vertical, 8)
        }
        .buttonStyle(.borderedProminent)
        .tint(buttonTintColor)
        .controlSize(.large)
        .disabled(!isEnabled)
        .animation(.easeInOut(duration: 0.3), value: connectionState)
    }
    
    // MARK: - Computed Properties
    private var buttonTintColor: Color {
        switch connectionState {
        case .disconnected:
            return Color.accentColor
        case .connecting:
            return Color(nsColor: .systemOrange)
        case .connected:
            return Color(nsColor: .systemRed)
        }
        
    }
    
}
