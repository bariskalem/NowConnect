//
//  ErrorView.swift
//  NowConnect
//
//  Created by Barış Kalem
//

import SwiftUI

struct ErrorView: View {
    @Binding var alertShowing: Bool
    var body: some View {
        VStack {
            RoundedRectangle(cornerRadius: 12)
                .fill(Color.white)
                .opacity(0.5)
                .frame(width: 220, height: 130)
                .overlay(
                    VStack {
                        Spacer()
                        Label("Try again", systemImage: "info.circle.fill").font(.system(size: 20))
                        Spacer().frame(height: 4)
                        Text("Please fill the required fields").font(.system(size: 14))
                        Spacer().frame(height: 20)
                        Button(action: {alertShowing.toggle()}) {
                            Text("OK")
                        }
                        Spacer()
                    }
                )
            
        }.frame(width: 300, height: 202)
    }
}

#Preview {
    ErrorView(alertShowing: .constant(false))
}
