//
//  IconSelector.swift
//  NowConnect
//
//  Created by Barış Kalem on 08.10.23.
//

import Foundation
import SwiftUI

struct IconSelector {
    @ObservedObject var connectionStatus: ConnectionStatus
    
    func getIconName() -> String {
        return connectionStatus.status == .connected ? "connected_shield" : "disconnected_shield"
    }
}
