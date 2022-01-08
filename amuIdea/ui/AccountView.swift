//
//  AccountView.swift
//  amuIdea
//
//  Created by gusan on 2022/01/08.
//

import SwiftUI

import SwiftUI

struct AccountView : View {
    @State private var editId = ""
    @State private var editPw = ""
    @State private var editNick = ""
    @State private var isToggled = false

    var body : some View {
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
                    TextField("비밀번호를 입력하세요.", text: $editPw)
                    Divider()
                }
            }
            Spacer()
                .frame(height: 20.0)
            HStack {
                Text("Nick")
                    .font(.custom("custom", size: 16))
                    .padding(.trailing)
                    .frame(width: 48.0)
                
                VStack {
                    TextField("닉네임을 입력하세요.", text: $editPw)
                    Divider()
                }
            }
            Spacer()
                .frame(height:20)
            Button(action: {
                
            }) {
                Spacer()
                Text("회원가입")
                    .foregroundColor(Color.white)
                Spacer()
            }.frame(height: 40.0).background(Color.black)
            
            Spacer()
                .frame(height:20)
            Button(action: {
                
            }) {
                Spacer()
                Text("취소")
                    .foregroundColor(Color.white)
                Spacer()
            }.frame(height: 40.0).background(Color.black)
        }
        .padding(32.0)
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
    }
}
