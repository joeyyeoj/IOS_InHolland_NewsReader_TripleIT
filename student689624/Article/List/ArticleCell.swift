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
            Image(systemName: "photo").resizable().frame(width: 75.0, height: 75.0, alignment: .leading).aspectRatio(contentMode: .fill).padding()
            Text("Van der Breggen en Blaak kondigen afscheid aan als wielrenster").font(.title3)
            Image(systemName: "heart.fill").padding()
            Image(systemName: "chevron.right")
        }.padding()
    }
}

struct ArticleCell_Previews: PreviewProvider {
    static var previews: some View {
        ArticleCell()
    }
}
