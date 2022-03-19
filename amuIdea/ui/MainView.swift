//
//  MainView.swift
//  amuIdea
//
//  Created by gusan on 2022/01/08.
//

import SwiftUI

struct MainView: View {
    @State var willMoveNextScreen = false
    @State private var editWords = ""
    let postVM = PostViewModel()
    let userVM = UserViewModel()
    @State var word1 = ""
    @State var word2 = ""
    @State var word3 = ""
    @State private var showAlert = false
    @State private var alertMessage = ""

    var body: some View {
        VStack {
            Text(word1)
                .font(.title)
                .fontWeight(.bold)
            Text(word2)
                .font(.title)
                .fontWeight(.bold)
            Text(word3)
                .font(.title)
                .fontWeight(.bold)
            Spacer().frame(height:20)
            TextField("단어를 조합해보세요.", text: $editWords)
                .multilineTextAlignment(.center)
                .font(.title3)
            Divider()
            Spacer().frame(height:20)
            NavigationLink(destination: ListView(), isActive: $willMoveNextScreen) {
            Button(action: {
                guard !editWords.isEmpty else {
                    self.showAlert = true
                    self.alertMessage = "아이디어를 입력하세요."
                    return
                }
                
                let date = Util().getDateFormat()
                let strWords = word1 + ", " + word2 + ", " + word3
                let idea = self.editWords
                postVM.callAddIdea(id: userVM.getLoginId(), date: date, words: strWords, idea: idea) {(response) in
                    if response?.statusCode == 200 {
                        willMoveNextScreen = true
                    }
                }
            }) {
                Spacer()
                Text("OK")
                    .foregroundColor(Color.white)
                Spacer()
            }.frame(height: 40.0).background(Color.black)
                .alert(isPresented:$showAlert) {
                    Alert(title:Text("알림"), message: Text(self.alertMessage), dismissButton:.default(Text("확인")))
                }
            }
        }.padding(12)
            .onAppear {
                let id = userVM.getLoginId()
                let date = Util().getDateFormat()
                postVM.callGetWord(id: id, date: date) {(response) in
                    if response?.statusCode == 200 {
                        let words = response?.msg
                        word1 = (words?[0])!
                        word2 = (words?[1])!
                        word3 = (words?[2])!
                    }
                    
                }
            }.navigationBarBackButtonHidden(true)
    }
}

//struct MainView_Previews: PreviewProvider {
//    static var previews: some View {
//        MainView()
//    }
//}
