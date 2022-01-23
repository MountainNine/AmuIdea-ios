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
}