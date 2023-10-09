//
//  AboutView.swift
//  NowConnect
//
//  Created by Barış Kalem
//

import SwiftUI

struct AboutView: View {
    @Binding var aboutShowing: Bool
    var body: some View {
        VStack{
            Image("nowconnect_shield")
                .resizable()
                .frame(width: 80, height: 80)
            Spacer().frame(height: 1)
            Text("NowConnect").font(.title3)
            Spacer().frame(height: 15)
            HStack {
                Text("made with")
                Spacer().frame(width: 3)
                Image(systemName: "heart.fill")
                    .foregroundColor(.red)
                Spacer().frame(width: 3)
                Text("by")
                Spacer().frame(width: 3)
                Text("[barış kalem](https://github.com/bariskalem)")
            }

            HStack {
                Text("logo design: ")
                Spacer().frame(width: 0)
                Text("[bevkcan](https://bevkcan.xyz)")
            }
            
            Spacer().frame(height: 8)
            Button(action: {aboutShowing.toggle()}) {
                Image(systemName: "hand.thumbsup.fill")
            }
        }.frame(width: 300, height: 202)
        
    }
}


#Preview {
    AboutView(aboutShowing: .constant(true))
}
