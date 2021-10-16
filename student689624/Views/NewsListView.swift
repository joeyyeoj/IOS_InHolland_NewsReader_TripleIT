//
//  NewsListView.swift
//  student689624
//
//  Created by user206790 on 10/16/21.
//

import SwiftUI

struct NewsListView: View {
    @StateObject var viewModel = NewsViewModelImpl(service: NewsServiceImpl())
    let feedId: Int
    
    
    
    var body: some View {
        Group {
            switch viewModel.state {
            case .loading:
                ProgressView()
            case .failed(let error):
                ErrorView(error: error, handler: { viewModel.getArticles(feedId: feedId) })
            case .success(let articles):
                    List(articles) {
                        item in ArticleCell(article: item)
                    }.navigationTitle(Text("Alles"))
            }
        }.onAppear(perform: {
            print(feedId)
            viewModel.getArticles(feedId:feedId) })
        }
    }

struct NewsListView_Previews: PreviewProvider {
    static var previews: some View {
        NewsListView(feedId: 0)
    }
}
