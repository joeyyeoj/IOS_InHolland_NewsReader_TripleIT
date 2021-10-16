//
//  NewsViewModel.swift
//  student689624
//
//  Created by user206790 on 10/16/21.
//

import Foundation
import Combine
import UIKit

protocol NewsViewModel{
    func getArticles(feedId: Int)
}

class NewsViewModelImpl: ObservableObject, NewsViewModel {
    private let service: NewsService
    private(set) var articles = [Article]()
    private var cancellables = Set<AnyCancellable>()
    
    @Published private(set) var state: ResultState = .loading
    
    init(service: NewsService){
        self.service = service
    }
    

    func getArticles(feedId: Int) {
        self.state = .loading
        let cancellable = service.request(from: .getNews(feedId))
            .sink {
                res in
                switch res{
                case .finished:
                    self.state = .success(content: self.articles)
                    break
                case .failure(let error):
                    self.state = .failed(error: error)
                    break
                }
            } receiveValue: {
                (response) in self.articles = response.Results
            }
        
        self.cancellables.insert(cancellable)
    }
}
