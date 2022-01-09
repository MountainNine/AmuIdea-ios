//
//  ListView.swift
//  amuIdea
//
//  Created by gusan on 2022/01/09.
//

import SwiftUI

struct WordItem: Identifiable {
    var id = UUID()
    var date: String
    var words: String
    var sentence: String
}

var wordItem: [WordItem] = [
    WordItem(date: "2022/01/09", words: "word1 word2 word3", sentence: " word1word2word3"),
    WordItem(date: "2022/01/09", words: "word1 word2 word3", sentence: " word1word2word3")
]

struct ListView: View {
    var body: some View {
        List(wordItem) {
            item in VStack(alignment:.leading) {
                Text(item.date)
                Text(item.words)
                Text(item.sentence)
            }
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
