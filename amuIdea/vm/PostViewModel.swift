//
//  PostViewModel.swift
//  amuIdea
//
//  Created by gusan on 2022/01/23.
//

import Foundation

class PostViewModel : ObservableObject {
    func callAddWord(id: String, date: String, completion:@escaping(WordResponse?) -> ()) {
        let post = Post(id:id, date:date, words:nil, idea:nil)
        WebService().addWord(post:post, completion:completion)
    }
}
