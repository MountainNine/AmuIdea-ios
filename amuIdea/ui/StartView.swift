//
//  StartView.swift
//  amuIdea
//
//  Created by gusan on 2022/01/08.
//

import SwiftUI

struct StartView: View {
    var body: some View {
        VStack {
            Text("오늘의\n아이디어는?")
                .font(.largeTitle)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
            
            Button(action: {
                
            }) {
                Spacer()
                    .frame(width:57)
                Text("START")
                    .foregroundColor(Color.white)
                Spacer()
                    .frame(width:57)
            }.frame(height: 40.0).background(Color.black)
        }
        
    }
}

struct StartView_Previews: PreviewProvider {
    static var previews: some View {
        StartView()
    }
}
