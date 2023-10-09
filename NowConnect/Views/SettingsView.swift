//
//  SettingsView.swift
//  NowConnect
//
//  Created by Barış Kalem
//

import SwiftUI

struct SettingsView: View {
    @Binding var settingsOpened: Bool
    @Binding var hasGroup: Bool
    @ObservedObject var keychain = KeychainAccessVPN.keychainGlobal
    
    @AppStorage("host") var host: String = ""
    @AppStorage("username") var username: String = ""
    @Binding var pwd: String
    @AppStorage("group") var groupInt: Int = 0

    @State private var alertShowing: Bool = false
    @State private var aboutShowing: Bool = false
    
    var body: some View {
        if alertShowing {
            ErrorView(alertShowing: $alertShowing)
        }
        else if aboutShowing {
            AboutView(aboutShowing: $aboutShowing)
        } else {
            VStack {
                HStack {
                    Text("Enter your account details:")
                    Spacer().frame(width: 30)
                    Button(action: {settingsOpened.toggle()}){
                        Image(systemName: "house.fill")
//                            Label("Go back...", systemImage: "arrowshape.backward.circle.fill")
//                                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                    }
                }
                TextField("Host address", text: $host)
                TextField("Username", text: $username)
                SecureField("Password", text: $pwd)
//                TextField("Group (optional)", text: $group)
                Stepper(value: $groupInt, in: 0...100) {
                    Text("Group \(self.groupInt)")
                }.padding(.horizontal)
                Button(action: {
                    if username == "" || pwd == "" {
                        self.alertShowing = true
                    } else {
                        self.keychain.setUserSecret(username: self.username, password: self.pwd)
//                        self.username = ""
                        self.pwd = ""
                    }
                }){
                    Text("Save account")
                }
                Divider()
                    .padding(.horizontal, 6)
                VStack {
                    HStack {
                        Button(action: {self.aboutShowing = true}){
                            Image(systemName: "info.circle.fill")
                        }
                        Button(action: {
                            if username == "" {
                                self.alertShowing = true
                            } else {
                                self.username = ""
                                self.groupInt = 1
                                self.keychain.removeUserSecret(username: self.username)
                            }
                        }){HStack{
                            Image(systemName: "trash.fill")
                                .foregroundStyle(Color(red: 255/255, green: 59/255, blue: 48/255))
                                .padding(.top, 1)
                            Text("Delete all account details")
                        }
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    SettingsView(settingsOpened: .constant(true), hasGroup: .constant(true), pwd: .constant("123"))
}
