//
//  ArticleCell.swift
//  student689624
//
//  Created by user206790 on 10/14/21.
//

import SwiftUI

struct ArticleCell: View {
    var body: some View {
        HStack{
            Image(systemName: "placeholder").resizable().frame(width: 75.0, height: 75.0, alignment: .leading)
            Text("Titel van artikel").padding().font(.title2)
            Spacer()
            Image(systemName: "heart.fill")
        }.padding()
    }
}

struct ArticleCell_Previews: PreviewProvider {
    static var previews: some View {
        ArticleCell()
    }
}
