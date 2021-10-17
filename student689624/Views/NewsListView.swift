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
        var feedTitle = { () -> String in
            switch feedId{
                case 1:
                    return "Algemeen"
                case 2:
                    return "Internet"
                case 3:
                    return "Sport"
                case 4:
                    return "Opmerkelijk"
                case 5:
                    return "Games"
                case 6:
                    return "Wetenschap"

            default:
                return "Nieuws"
            }
            
        }()
        
        Group {
            switch viewModel.state {
            case .loading:
                ProgressView()
            case .failed(let error):
                ErrorView(error: error, handler: { viewModel.getArticles(feedId: feedId) })
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
                    }.navigationTitle(feedTitle)
                    
            }
        }.onAppear(perform: {
            viewModel.getArticles(feedId:feedId) })
        }
    }

struct NewsListView_Previews: PreviewProvider {
    static var previews: some View {
        NewsListView(feedId: 0)
    }
}
