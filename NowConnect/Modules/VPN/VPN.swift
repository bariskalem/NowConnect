//
//  VPN.swift
//  NowConnect
//
//  Created by Barış Kalem
//


func connectVPN(username: String, password: String?, group: Int, address: String) -> Bool {
    if stateOfVPN() {
        return true
    }
    
    var input = "\(username)\n\(password!)\ny\nexit\nEOF\n"
    if group != 0 {
        input = "\(group - 1)\n" + input
    }

    let arguments = ["-s", "connect", address]
    
    let terminalOutput = runVPNfromTerminal(input: input, arguments: arguments)
    
    if terminalOutput.contains(">> notice: Connected to") {
        return true
    }
    else {
        return false
    }
}

func disconnectVPN() -> Bool {
    if !stateOfVPN() {
        return true
    }
    
    let terminalOutput = runVPNfromTerminal(input: String(), arguments: ["disconnect"])
    if terminalOutput.contains("state: Disconnected"){
        return true
    }
    else {
        return false
    }
}

func stateOfVPN() -> Bool {
    let terminalOutput = runVPNfromTerminal(input: String(), arguments: ["state"])
    if terminalOutput.contains(">> state: Connected") {
        return true
    }
    else {
        return false
    }
}

//func getStats() -> String {
//    let terminalOutput = runVPNfromTerminal(input: String(), arguments: ["stats"])
//    return terminalOutput
//}
