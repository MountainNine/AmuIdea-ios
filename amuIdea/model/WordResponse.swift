//
//  WordResponse.swift
//  amuIdea
//
//  Created by gusan on 2022/01/23.
//

import Foundation
struct WordResponse : Decodable {
    let statusCode : Int?
    let msg : [String]?
}
