////
////  SettingsView.swift
////  NowConnect
////
////  Created by Barış Kalem on 02.09.23.
////
//
//import SwiftUI
//
//struct SettingsView: View {
//    private enum Tabs: Hashable {
//        case account, about
//    }
//    var body: some View {
//        TabView {
//            AccountSettingsView()
//                .tabItem {
//                    Label("Account", systemImage: "gear")
//                }
//                .tag(Tabs.account)
//            AboutView()
//                .tabItem {
//                    Label("About", systemImage: "info.circle")
//                }
//                .tag(Tabs.about)
//        }
//        .padding(20)
//        .frame(width: 500, height: 250)
//    }
//}
//
//struct AccountSettingsView: View {
//    var body: some View {
//        Text("Account Settings")
//            .font(.title)
//    }
//}
//
//struct AboutView: View {
//    var body: some View {
//        HStack {
//            Spacer()
//            Text("Made with")
//            Image(systemName: "heart.fill")
//                .foregroundColor(.red)
//            Text(" by Barış Kalem")
//            Spacer()
//        }
//    }
//}
//
//
//struct SettingsView_Previews: PreviewProvider {
//    static var previews: some View {
//        SettingsView()
//    }
//}
