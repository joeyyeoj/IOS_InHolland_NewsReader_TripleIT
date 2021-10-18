//
//  NewsEndpoint.swift
//  student689624
//
//  Created by user206790 on 10/16/21.
//

import Foundation


protocol APIBuilder{
    var authToken: String { get }
    var urlRequest: URLRequest { get}
    var baseUrl: String { get }
    var path: String { get }
    var queryParams: [URLQueryItem]  { get }
}

enum NewsAPI{
    case getNews(Int)
    case getLikedNews
    case likeArticle(Int)
    case login(username: String, password: String)
    case register(username: String, password: String)
}

extension NewsAPI: APIBuilder {
    var authToken: String {
        let localstorage: LocalStorage = .init()
        return localstorage.fetchAuthToken()
    }
    
    var urlRequest: URLRequest {
        var url = URLComponents(string: "\(self.baseUrl)\(self.path)")
        var request = URLRequest(url: (url?.url)!)
        
        
        switch self{
        case .getNews(_):
            url?.queryItems = self.queryParams
            request.httpMethod = "GET"
        case .getLikedNews:
            request.httpMethod = "GET"
        case .likeArticle(_):
            request.httpMethod = "PUT"
        case .login(username: let username, password: let password):
            do{
                request.setValue("application/json", forHTTPHeaderField: "Content-Type")
                let jsonEncoder = JSONEncoder()
                let body = LoginBody(UserName: username, Password: password)
                let JsonBody = try jsonEncoder.encode(body)
                request.httpMethod = "POST"
                request.httpBody = JsonBody
            }
            catch{
            }
        case .register(username: let username, password: let password):
            request.httpMethod = "POST"
        }
        
        //Write if statement checking if KeyChainAccess has a token, if true, add, if not, dont add
        if(self.authToken != ""){
            request.addValue(self.authToken, forHTTPHeaderField: "x-authtoken")
        }
        return request
    }
    
    var baseUrl: String {
        return "https://inhollandbackend.azurewebsites.net/api/"
    }
    
    var path: String {
        switch self {
        case .getNews(let feedId):
            return "Articles"
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
