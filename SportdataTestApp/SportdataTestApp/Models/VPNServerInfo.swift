import Foundation

struct VPNServerInfo: Identifiable, Hashable {
    
    let id: String
    let displayName: String
    let countryFlag: String
    
    static let availableServers: [VPNServerInfo] = [
        VPNServerInfo(id: "de", displayName: "Germany", countryFlag: "🇩🇪"),
        VPNServerInfo(id: "us", displayName: "USA", countryFlag: "🇺🇸"),
        VPNServerInfo(id: "jp", displayName: "Japan", countryFlag: "🇯🇵"),
        VPNServerInfo(id: "nl", displayName: "Netherlands", countryFlag: "🇳🇱"),
    ]
    
}
