//
//  MainView.swift
//  amuIdea
//
//  Created by gusan on 2022/01/08.
//

import SwiftUI

struct MainView: View {
    @State private var editWords = ""

    var body: some View {
        VStack {
            Text("Word1")
                .font(.title)
                .fontWeight(.bold)
            Text("Word2")
                .font(.title)
                .fontWeight(.bold)
            Text("Word3")
                .font(.title)
                .fontWeight(.bold)
            Spacer().frame(height:20)
            TextField("단어를 조합해보세요.", text: $editWords)
                .multilineTextAlignment(.center)
                .font(.title3)
            Divider()
            Spacer().frame(height:20)
            Button(action: {}) {
                Spacer()
                Text("OK")
                    .foregroundColor(Color.white)
                Spacer()
            }.frame(height: 40.0).background(Color.black)
        }.padding(12)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
