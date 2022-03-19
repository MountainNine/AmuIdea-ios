//
//  LoginView.swift
//  amuIdea
//
//  Created by gusan on 2022/01/06.
//

import SwiftUI

struct LoginView : View {
    @State private var editId = ""
    @State private var editPw = ""
    @State private var isToggled = false
    @State private var showAlert = false
    @State private var alertMessage = ""
    @State private var willMoveToNextScreen : Int? = -1
    @State private var nextScreenNum : Int? = -1
    private let userVM = UserViewModel()

    var body : some View {
        NavigationView {
        VStack(spacing: 0.0) {
            HStack {
                Text("ID")
                    .font(.title3)
                    .padding(.trailing)
                    .frame(width: 48.0)
                VStack {
                    TextField("아이디를 입력하세요.", text: $editId)
                    Divider()
                }
            }
            Spacer()
                .frame(height: 20.0)
            HStack {
                Text("PW")
                    .font(.title3)
                    .padding(.trailing)
                    .frame(width: 48.0)
                
                VStack {
                    SecureField("비밀번호를 입력하세요.", text: $editPw)
                    Divider()
                }
            }
            Spacer()
                .frame(height: 20.0)
            HStack {
                CheckBoxView(checked: $isToggled)
                Text("자동 로그인")
                    .font(.title3)
                    .onTapGesture {
                        self.isToggled.toggle()
                    }
                Spacer()
            }
            Spacer()
                .frame(height:20)
            NavigationLink(destination: getNextView(), tag: 1, selection: $willMoveToNextScreen) {
            Button(action: {
                guard !editId.isEmpty else {
                    self.showAlert = true
                    self.alertMessage = "아이디를 입력하세요."
                    return
                }
                
                guard !editPw.isEmpty else {
                    self.showAlert = true
                    self.alertMessage = "비밀번호를 입력하세요."
                    return
                }
                
                callLogin(id: self.editId, pw: self.editPw)
            }) {
                Spacer()
                Text("로그인")
                    .foregroundColor(Color.white)
                Spacer()
            }.frame(height: 40.0).background(Color.black)
                .alert(isPresented:$showAlert) {
                    Alert(title:Text("알림"), message: Text(self.alertMessage), dismissButton:.default(Text("확인")))
                }
            }
            
            Spacer()
                .frame(height:20)
            NavigationLink(destination: AccountView(), tag: 0, selection:$willMoveToNextScreen) {
                Button(action: {
                    self.willMoveToNextScreen = 0
                }) {
                    Spacer()
                    Text("회원가입")
                        .foregroundColor(Color.white)
                    Spacer()
                }.frame(height: 40.0).background(Color.black)
            }
        }
        .padding(32.0)
        }
    }
    
    func callLogin(id: String, pw: String) {
        userVM.callLogin(id: id, pw: pw) {
            (response) in
            if(response?.statusCode == 200) {
                userVM.putAutoLogin(isChecked: isToggled)
                userVM.putLoginId(id:self.editId)
                userVM.getCurrentState(id: id, date: Util().getDateFormat()) {(response) in
                    if(response?.statusCode == 200) {
                        let msg = response?.msg
                        switch msg {
                        case 0:
                            self.nextScreenNum = 1
                        case 1:
                            self.nextScreenNum = 2
                        case 2:
                            self.nextScreenNum = 3
                        case .none:
                            self.nextScreenNum = -1
                        case .some(_):
                            self.nextScreenNum = -1
                        }
                        self.willMoveToNextScreen = 1
                    }
                }
            }
        }
    }
    
    @ViewBuilder
    func getNextView()->some View {
        switch nextScreenNum {
        case 1:
             StartView()
        case 2:
             MainView()
        case 3:
             ListView()
        case .none:
            StartView()
        case .some(_):
            StartView()
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
