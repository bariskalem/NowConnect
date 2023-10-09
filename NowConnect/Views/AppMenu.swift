//
//  AppMenu.swift
//  NowConnect
//
//  Created by Barış Kalem
//

import SwiftUI

struct AppMenu: View {
    @ObservedObject private var connectionStatus = ConnectionStatus.sharedStatus
    @State private var settingsOpened: Bool = false
    @State private var isButtonDisabled: Bool = false
    
    @State private var hasGroup: Bool = false // TODO: Make Group optional
    
    @AppStorage("host") var host: String = ""
    @AppStorage("username") var username: String = ""
    @State private var pwd: String = ""
    @AppStorage("group") var groupInt: Int = 0
    
    
    var body: some View {
        if settingsOpened {
            SettingsView(settingsOpened: $settingsOpened,
                         hasGroup: $hasGroup,
                         username: username,
                         pwd: $pwd,
                         groupInt: groupInt)
                .frame(width: 240, height: 202)
                .padding(.all, 8)
        } else {
            VStack {
                ConnectionView(isButtonDisabled: $isButtonDisabled,
                               settingsOpened: $settingsOpened,
                               hasGroup: $hasGroup,
                               username: username,
                               groupInt: groupInt)
                Divider()
                    .padding(.vertical, 2)
                    .padding(.horizontal, 6)
                HStack {
                    Button(action: {
                        isButtonDisabled = true
                        if stateOfVPN() {
                            connectionStatus.status = .disconnecting
                            _ = disconnectVPN()
                            NSApplication.shared.terminate(nil)
                        } else {
                            NSApplication.shared.terminate(nil)
                        }
                    }
                    ){
                        Label("Quit", systemImage: "xmark.circle.fill")
                            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                    }
                }
                
            }
            .frame(width: 240, height: 110)
            .padding(.horizontal, 8)
            .padding(.vertical, 4)
        }
    }
}


struct AppMenu_Previews: PreviewProvider {
    static var previews: some View {
        AppMenu()
    }
}
