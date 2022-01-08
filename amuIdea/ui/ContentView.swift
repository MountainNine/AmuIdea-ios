//
//  ContentView.swift
//  amuIdea
//
//  Created by gusan on 2022/01/05.
//

import SwiftUI

struct ContentView: View {
    @State var isActive = false
    
    var body: some View {
        VStack {
            if self.isActive {
                LoginView()
            } else {
                Text("AmuIdea")
                    .font(.title)
                    .padding()
            }
        }.onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                withAnimation {
                    self.isActive = true
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
