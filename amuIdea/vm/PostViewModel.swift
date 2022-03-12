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
    
    func callGetWord(id: String, date: String, completion:@escaping(WordResponse?) -> ()) {
        let post = Post(id: id, date: date, words: nil, idea: nil)
        WebService().getWord(post:post, completion:completion)
    }
    
    func callAddIdea(id: String, date: String, words: String, idea: String, completion:@escaping(SimpleResponse?) -> ()) {
        let post = Post(id: id, date: date, words: words, idea: idea)
        WebService().addIdea(post:post, completion:completion)
    }
    
    func callGetIdeas(id: String, date: String, completion:@escaping(PostResponse?) -> ()) {
        let post = Post(id: id, date: date, words: nil, idea: nil)
        WebService().getIdeas(post:post, completion:completion)
    }
}
