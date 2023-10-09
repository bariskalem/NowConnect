//
//  ConnectionStatus.swift
//  NowConnect
//
//  Created by Barış Kalem
//

import Foundation
import SwiftUI

class ConnectionStatus: ObservableObject {
    static let sharedStatus = ConnectionStatus()
    @Published var status: ConnectionStatusType = .disconnected
}
