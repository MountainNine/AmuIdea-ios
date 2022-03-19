//
//  ContentView.swift
//  amuIdea
//
//  Created by gusan on 2022/01/05.
//

import SwiftUI

struct SplashView: View {
    @State var willMoveNextScreen = -2
    let userVM = UserViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                if self.willMoveNextScreen == -1 {
                    LoginView()
                } else if self.willMoveNextScreen == 0 {
                    StartView()
                } else if self.willMoveNextScreen == 1 {
                    MainView()
                } else if self.willMoveNextScreen == 2 {
                    ListView()
                } else {
                    Text("AmuIdea")
                        .font(.title)
                        .padding()
                }
            }.onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                    withAnimation {
                        if(userVM.getAutoLogin() == true) {
                            userVM.getCurrentState(id: userVM.getLoginId(), date: Util().getDateFormat()) { (response) in
                                if(response?.statusCode == 200) {
                                    let msg = response?.msg
                                    switch msg {
                                    case 0:
                                        self.willMoveNextScreen = 0
                                    case 1:
                                        self.willMoveNextScreen = 1
                                    case 2:
                                        self.willMoveNextScreen = 2
                                    case .none:
                                        self.willMoveNextScreen = -1
                                    case .some(_):
                                        self.willMoveNextScreen = -1
                                    }
                                }
                            }
                        } else {
                            self.willMoveNextScreen = -1
                        }
                    }
                }
            }
        }
    }
}
