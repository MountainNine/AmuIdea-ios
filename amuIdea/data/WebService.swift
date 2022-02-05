//
//  WebService.swift
//  amuIdea
//
//  Created by gusan on 2022/01/23.
//

import Foundation
import Alamofire

class WebService {
    let baseUrl = "https://a5mppwt298.execute-api.ap-northeast-2.amazonaws.com/amuidea/"
    func login(user: User, completion: @escaping(SimpleResponse?) -> ()) {
        let params = ["id": user.id, "pw": user.pw]
        
        AF.request(URL(string: String(baseUrl + "login"))!, method: .post, parameters: params as Parameters, encoding: JSONEncoding.default)
            .validate(statusCode: 200..<500)
            .responseDecodable(of:SimpleResponse.self) {response in
                switch response.result {
                    case .success:
                    let data = response.value
                    completion(SimpleResponse(statusCode: data!.statusCode, msg: data!.msg))
                    break
                    
                case .failure(let err):
                    print(err)
                    completion(nil)
                    break
                }
            }
    }
    
    func addWord(post: Post, completion: @escaping(WordResponse?) -> ()) {
        let params = ["id":post.id, "date":post.date]
        
        AF.request(URL(string: String(baseUrl + "addword"))!, method:.post, parameters: params as Parameters, encoding:JSONEncoding.default)
            .validate(statusCode: 200..<500)
            .responseDecodable(of:WordResponse.self) {response in
                switch response.result {
                case .success(let code):
                    print(code)
                    let data = response.value
                    completion(WordResponse(statusCode: data!.statusCode, msg: data!.msg))
                    break
                    
                case .failure(let err):
                    print(err)
                    completion(nil)
                    break
                }
            }
    }
}
