//
//  NewsEndpoint.swift
//  student689624
//
//  Created by user206790 on 10/16/21.
//

import Foundation


protocol APIBuilder{
    var urlRequest: URLRequest { get}
    var baseUrl: String { get }
    var path: String { get }
    var queryParams: [URLQueryItem]  { get }
}

enum NewsAPI{
    case getNews(Int)
    case getLikedNews
    case likeArticle(Int)
    case login
    case register
}

extension NewsAPI: APIBuilder {
    
    var urlRequest: URLRequest {
        var url = URLComponents(string: "\(self.baseUrl)\(self.path)")
        url?.queryItems = self.queryParams
        return URLRequest(url: (url?.url)!)
        
    }
    
    var baseUrl: String {
        return "https://inhollandbackend.azurewebsites.net/api/"
    }
    
    var path: String {
        switch self {
        case .getNews(let feedId):
            return "Articles?feed=\(feedId)"
        case .getLikedNews:
            return "Articles/liked"
        case .likeArticle(let articleId):
            return "Articles/\(articleId)/like"
        case .login:
            return "Users/login"
        case .register:
            return "Users/register"
        }
    }
    
    var queryParams: [URLQueryItem] {
        switch self {
            case .getNews(let feedId):
                return [URLQueryItem(name: "feed", value: String(feedId))]
        case .getLikedNews, .likeArticle(_), .login, .register:
            return []
        }
    }
}
