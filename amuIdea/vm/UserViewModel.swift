//
//  UserViewModel.swift
//  amuIdea
//
//  Created by gusan on 2022/01/16.
//

import Foundation

class UserViewModel: ObservableObject {
    func callLogin(id: String, pw: String, completion:@escaping(SimpleResponse?) -> ()) {
        let user : User = User(id: id,pw: pw,name: nil)
        WebService().login(user:user, completion: completion)
    }
    
    func callAccount(id: String, pw: String, nick: String, completion:@escaping(SimpleResponse?) -> ()) {
        let user = User(id: id,pw: pw, name: nick)
        WebService().createAccount(user: user, completion: completion)
    }
    
    func putLoginId(id:String) {
        UserDefaults.standard.set(id, forKey:"loginID")
    }
    
    
    func putAutoLogin(isChecked:Bool) {
        UserDefaults.standard.set(isChecked, forKey: "autoLogin")
    }
    
    func getAutoLogin()-> Bool {
        if(UserDefaults.standard.object(forKey:"autoLogin") == nil) {
            return false
        }
        return UserDefaults.standard.value(forKey: "autoLogin") as! Bool
    }
    
    func getLoginId()-> String {
        return UserDefaults.standard.value(forKey: "loginID") as! String
    }
    
    func getCurrentState(id: String, date: String, completion:@escaping(SimpleNumResponse?) -> ()) {
        let post = Post(id: id, date: date, words: nil, idea: nil)
        WebService().getCurrentState(post: post, completion: completion)
    }
}
