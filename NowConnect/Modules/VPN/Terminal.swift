//
//  Terminal.swift
//  NowConnect
//
//  Created by Barış Kalem
//

import Foundation

func runVPNfromTerminal(input: String, arguments: [String]) -> String {
    let task = Process()
    
    let outputPipe = Pipe()
    task.standardOutput = outputPipe
    
//    task.executableURL = URL(fileURLWithPath: "/opt/cisco/anyconnect/bin/vpn") // TODO: Implement a way to select the executable in Settings
    task.executableURL = URL(fileURLWithPath: "/opt/cisco/secureclient/bin/vpn")
    task.arguments = arguments
    
    
    if !input.isEmpty {
        let inputPipe = Pipe()
        task.standardInput = inputPipe
        let inputData = input.data(using: .utf8)!
        inputPipe.fileHandleForWriting.write(inputData)
    }
    
    try! task.run()
    task.waitUntilExit()
    
    let outputData = outputPipe.fileHandleForReading.readDataToEndOfFile()
    let output = String(data: outputData, encoding: .utf8)!
    
    return output
}
