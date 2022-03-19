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
    var idea: String
}


struct ListView: View {
    @State var wordItem: [WordItem] = []
    let postVM = PostViewModel()
    let userVM = UserViewModel()
    var body: some View {
        List(wordItem) {
            item in VStack(alignment:.leading) {
                Text(item.date)
                Text(item.words)
                Text(item.idea)
            }
        }.onAppear {
            postVM.callGetIdeas(id:userVM.getLoginId(), date: Util().getDateFormat()) {(response) in
                if response?.statusCode == 200 {
                    let items = response!.msg!
                    for item in items {
                        wordItem.append(WordItem(date: item["StartDate"]!, words:item["Words"]!, idea:item["Idea"]!))
                    }

                }
                
            }
        }.navigationBarBackButtonHidden(true)
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
