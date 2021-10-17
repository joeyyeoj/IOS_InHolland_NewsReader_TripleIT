//
//  FilterView.swift
//  student689624
//
//  Created by user206790 on 10/17/21.
//

import SwiftUI

struct FilterView: View {
    let feedList = [NewsFeed(feedId: 1, name: "Algemeen"),
                    NewsFeed(feedId: 2, name: "Internet"),
                    NewsFeed(feedId: 3, name: "Sport"),
                    NewsFeed(feedId: 4, name: "Opmerkelijk"),
                    NewsFeed(feedId: 5, name: "Games"),
                    NewsFeed(feedId: 6, name: "Wetenschap"),]
    
    var body: some View {
            List(feedList){
                item in
                NavigationLink(destination: NewsListView(feedId: item.feedId)){
                    Text(item.name)
                }.navigationTitle(Text("Nieuwsfeeds"))
                    .navigationBarItems(
                    trailing:
                        NavigationLink(destination: ContentView()) {
                            Image(systemName: "person.fill")
            })
            }
    }
}

struct FilterView_Previews: PreviewProvider {
    static var previews: some View {
        FilterView()
    }
}
