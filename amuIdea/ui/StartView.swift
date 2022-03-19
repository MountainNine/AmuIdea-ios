//
//  StartView.swift
//  amuIdea
//
//  Created by gusan on 2022/01/08.
//

import SwiftUI

struct StartView: View {
    @State var willMoveNextScreen = false
    let userVM = UserViewModel()
    let postVM = PostViewModel()
    var body: some View {
        VStack {
            Text("오늘의\n아이디어는?")
                .font(.largeTitle)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
            
            NavigationLink(destination: MainView(), isActive: $willMoveNextScreen) {
                Button(action: {
                    let id = userVM.getLoginId()
                    let date = Util().getDateFormat()
                    postVM.callAddWord(id:id,date:date) {(response) in
                        if response?.statusCode == 200 {
                            willMoveNextScreen = true
                        }
                    }
                }) {
                    Spacer()
                        .frame(width:57)
                    Text("START")
                        .foregroundColor(Color.white)
                    Spacer()
                        .frame(width:57)
                }.frame(height: 40.0).background(Color.black)
            }
        }.navigationBarBackButtonHidden(true)
        
    }
}

struct StartView_Previews: PreviewProvider {
    static var previews: some View {
        StartView()
    }
}
