//
//  SimpleResponse.swift
//  amuIdea
//
//  Created by gusan on 2022/01/09.
//

import Foundation
struct SimpleResponse : Decodable {
    let statusCode : Int
    let msg : String
}
