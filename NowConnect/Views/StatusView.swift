//
//  StatusView.swift
//  NowConnect
//
//  Created by Barış Kalem
//

import SwiftUI

struct StatusView: View {
    let statusInfo: (text: String, color: Color)
    var body: some View {
        Text(statusInfo.text)
            .frame(minWidth: 0, maxWidth: 220, alignment: .leading)
        Spacer()
            .frame(width: 40)
        Circle()
            .fill(statusInfo.color)
            .frame(width: 10)
            .padding(.horizontal, 4)
        Spacer()
            .frame(width: 40)
    }
}

#Preview {
    StatusView(statusInfo: (text: "Connected", color: .green))
}
