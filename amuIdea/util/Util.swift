//
//  Util.swift
//  amuIdea
//
//  Created by gusan on 2022/01/23.
//

import Foundation

struct Util {
    func getDateFormat() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        dateFormatter.locale = Locale(identifier: "ko_KR")
        let date = dateFormatter.string(from: Date())
        return date
    }
}
