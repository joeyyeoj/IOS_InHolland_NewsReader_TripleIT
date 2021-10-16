//
//  ContentView.swift
//  student689624
//
//  Created by user206790 on 10/14/21.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModel = NewsViewModelImpl(service: NewsServiceImpl())
    
    
    var body: some View {
        Group {
            switch viewModel.state {
            case .loading:
                ProgressView()
            case .failed(let error):
                ErrorView(error: error, handler: { viewModel.getArticles(feedId: 0) })
            case .success(let articles):
                NavigationView {
                    List(articles) {
                        item in ArticleCell(article: item)
                    }.navigationTitle(Text("News"))
                }
            }
            
            
        }.onAppear(perform: { viewModel.getArticles(feedId: 1) })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
