//
//  PostResponse.swift
//  amuIdea
//
//  Created by gusan on 2022/02/27.
//

import Foundation
struct PostResponse : Decodable {
    let statusCode : Int?
    let msg : [[String: String]]?
}
