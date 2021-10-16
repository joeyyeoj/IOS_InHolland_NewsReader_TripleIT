//
//  ArticleDetail.swift
//  student689624
//
//  Created by user206790 on 10/14/21.
//

import SwiftUI

struct ArticleDetail: View {
    var body: some View {
        ScrollView{
            VStack(alignment: .leading){
                GeometryReader{ geo in
                    Image(systemName: "note").resizable().aspectRatio(contentMode: .fit).frame(width: geo.size.width, height: 300)
                }.frame(height: 300)
                Text("hier komt le datum").padding().font(.caption)
                Text("Titel van Artikel").padding().frame(alignment: .trailing).font(.title2)
                Text("Summary van artikel hele lange tekst afantastische placeholder wow wat super handig").padding()
            Spacer()
            }
        }
    }
}

struct ArticleDetail_Previews: PreviewProvider {
    static var previews: some View {
        ArticleDetail()
    }
}
