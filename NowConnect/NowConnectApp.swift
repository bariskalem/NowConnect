//
//  NowConnectApp.swift
//  NowConnect
//
//  Created by Barış Kalem
//

import SwiftUI
import AppKit

@main
struct NowConnectApp: App {
    @ObservedObject private var connectionStatus = ConnectionStatus.sharedStatus
    @Environment(\.colorScheme) var colorScheme
    
    var body: some Scene {
        MenuBarExtra {
            AppMenu()
        } label: {
            let image: NSImage = {
                $0.size.height = 16
                $0.size.width = 16
                return $0
            }(NSImage(named: (connectionStatus.status == .connected ? "connected_shield" : "disconnected_shield"))!)
            Image(nsImage: image)
        }
        .menuBarExtraStyle(.window)
    }
}
