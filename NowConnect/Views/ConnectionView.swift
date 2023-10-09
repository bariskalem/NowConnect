//
//  ConnectionView.swift
//  NowConnect
//
//  Created by Barış Kalem
//

import SwiftUI

struct ConnectionView: View {
    @ObservedObject private var connectionStatus =  ConnectionStatus.sharedStatus
    @Binding var isButtonDisabled: Bool
    @Binding var settingsOpened: Bool
    @Binding var hasGroup: Bool
    
    @ObservedObject var keychain = KeychainAccessVPN.keychainGlobal
    
    @AppStorage("host") var host: String = ""
    @AppStorage("username") var username: String = ""
    @AppStorage("group") var groupInt: Int = 0
    
    var body: some View {
        VStack {
            HStack {
                
                Text("VPN")
                    .bold()
//                Spacer().frame(width: 108)
                Spacer().frame(width: 75)
                Button(action: {
                    switch self.connectionStatus.status {
                    case .connecting:
                        isButtonDisabled = true
                    case .connected:
                        isButtonDisabled = true
                        connectionStatus.status = .disconnecting
                        if disconnectVPN() {
                            connectionStatus.status = .disconnected
                            
                        } else {
                            connectionStatus.status = stateOfVPN() ? .connected : .disconnected
                        }
                        isButtonDisabled = false
                    case .disconnecting:
                        isButtonDisabled = true
                    case .disconnected:
                        isButtonDisabled = true
                        connectionStatus.status = .connecting
                        if connectVPN(username: username,
                                      password: keychain.getUserSecret(username: username) ?? "",
                                      group: groupInt,
                                      address: host){
                            connectionStatus.status = .connected
                        } else {
                            connectionStatus.status = stateOfVPN() ? .connected : .disconnected
                        }
                        isButtonDisabled = false
                    }
                }){
                    switch self.connectionStatus.status {
                    case .connecting:
                        Text("Connect")
                    case .connected:
                        Text("Disconnect")
                    case .disconnecting:
                        Text("Disconnect")
                    case .disconnected:
                        Text("Connect")
                    }
                }
                .disabled(isButtonDisabled)
                .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxWidth: 85)
                Spacer().frame(width:7)
                Button(action: {settingsOpened.toggle()}) {
                    Image(systemName: "gearshape.fill")
                }
                
            }
            
            Divider()
                .padding(.vertical, 2)
                .padding(.horizontal, 1)
            HStack {
                switch self.connectionStatus.status {
                case .connecting:
                    StatusView(statusInfo: (text: "Connecting...", color: .yellow))
                case .connected:
                    StatusView(statusInfo: (text: "Connected", color: .green))
                case .disconnecting:
                    StatusView(statusInfo: (text: "Disconnecting...", color: .yellow))
                case .disconnected:
                    StatusView(statusInfo: (text: "Disconnected", color: .red))
                }
            }
            .padding(.vertical, 0.5)
        }
        .padding(.horizontal, 5)
        .frame(width: 240, height: 60)
        .background(.clear)
    }
}

#Preview {
                    ConnectionView(isButtonDisabled: .constant(false), settingsOpened: .constant(false),  hasGroup: .constant(true), username: "abc", groupInt: -1)
}
