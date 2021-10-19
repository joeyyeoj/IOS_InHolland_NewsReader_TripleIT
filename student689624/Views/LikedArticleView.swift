//
//  LikedArticleView.swift
//  student689624
//
//  Created by user206790 on 10/19/21.
//

import SwiftUI
import Combine

struct LikedArticleView: View {
    @StateObject var viewModel = NewsViewModelImpl(service: NewsServiceImpl())
    var body: some View {
        
            Group {
                switch viewModel.state {
                case .loading:
                    ProgressView()
                case .failed(let error):
                    ErrorView(error: error, handler: { viewModel.getLikedArticles() })
                case .success(let articles):
                        List(articles) {
                            item in
                            NavigationLink(destination: ArticleDetail(article: item)){
                                HStack{
                                    ArticleCell(article: item)
                                    if(item.isLiked){
                                        Image(systemName: "heart.fill").foregroundColor(.red)
                                    }
                                    else{
                                        Image(systemName: "heart").foregroundColor(.red)
                                    }
                                    
                                }
                            }
                        }.navigationTitle("Favorieten")
                    }
                }.onAppear(perform: {
                    viewModel.getLikedArticles() })
            }
    }

struct LikedArticleView_Previews: PreviewProvider {
    static var previews: some View {
        LikedArticleView()
    }
}
