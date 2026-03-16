import SwiftUI

struct VPNDashboardView: View {
    
    @StateObject private var viewModel = VPNConnectionViewModel()
    @State private var isSettingsPresented = false
    @State private var isHelpPresented = false
    
    var body: some View {
        VStack(spacing: 0) {
            ConnectionStatusIndicator(connectionState: viewModel.connectionState)
                .padding(.top, 32)
                .padding(.bottom, 24)
            
            Divider()
                .padding(.horizontal, 24)
            
            ServerSelectionPanel(selectedServer: $viewModel.selectedServer, availableServers: viewModel.availableServers, isEnabled: viewModel.isServerSelectionEnabled)
            .padding(.vertical, 20)
            .padding(.horizontal, 24)
            
            Divider()
                .padding(.horizontal, 24)
            
            ConnectionToggleButton(title: viewModel.toggleActionTitle, connectionState: viewModel.connectionState, isEnabled: viewModel.isToggleActionAvailable, action: { viewModel.performToggleAction() })
            .padding(.vertical, 24)
            .padding(.horizontal, 24)
            
            Spacer()
            
            HStack {
                Button {
                    isSettingsPresented.toggle()
                } label: {
                    Label("Settings", systemImage: "gearshape")
                        .font(.subheadline)
                }
                .buttonStyle(.plain)
                .foregroundStyle(Color(nsColor: .secondaryLabelColor))
                .popover(isPresented: $isSettingsPresented) {
                    SettingsContentView()
                }
                
                Spacer()
                
                Button {
                    isHelpPresented.toggle()
                } label: {
                    Label("Help", systemImage: "questionmark.circle")
                        .font(.subheadline)
                }
                .buttonStyle(.plain)
                .foregroundStyle(Color(nsColor: .secondaryLabelColor))
                .popover(isPresented: $isHelpPresented) {
                    HelpContentView()
                }
            }
            .padding(.horizontal, 24)
            .padding(.bottom, 16)
        }
        .frame(width: 320, height: 420)
        .background(Color(nsColor: .windowBackgroundColor))
        .preferredColorScheme(.light)
    }
    
}
