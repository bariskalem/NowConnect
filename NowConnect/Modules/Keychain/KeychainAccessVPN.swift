//
//  KeychainAccessVPN.swift
//  NowConnect
//
//  Created by Barış Kalem
//

import Foundation
import SwiftUI
import KeychainAccess


class KeychainAccessVPN: ObservableObject {
    private let keychainVPN = Keychain(service: "com.github.bariskalem.nowconnect")
        .accessibility(.afterFirstUnlock)
        .label("NowConnect Keychain")
        .comment("This is a keychain item to store your VPN credentials.")
    
    static let keychainGlobal = KeychainAccessVPN()
    
    private init() {}
    
    
    func setUserSecret(username: String, password: String){
        DispatchQueue.global().async {
            self.keychainVPN[username] = password
        }
    }
    
    func getUserSecret(username: String) -> String? {
        return keychainVPN[username]
    }
    
    func removeUserSecret(username: String) {
        DispatchQueue.global().async {
            self.keychainVPN[username] = nil
        }
    }
    
}

