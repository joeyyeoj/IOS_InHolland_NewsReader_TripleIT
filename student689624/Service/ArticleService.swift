//
//  ArticleService.swift
//  student689624
//
//  Created by user206790 on 10/19/21.
//

import Foundation
import Combine

protocol ArticleService {
    func request(from endpoint: NewsAPI) -> AnyPublisher<Int, APIError>
}

struct ArticleServiceImpl: ArticleService {
    func request(from endpoint: NewsAPI) -> AnyPublisher<Int, APIError> {
        return URLSession
            .shared
            .dataTaskPublisher(for: endpoint.urlRequest)
            .receive(on: DispatchQueue.main)
            .mapError { _ in APIError.unknown}
            .flatMap { data, response -> AnyPublisher<Int, APIError> in
                guard let response = response as? HTTPURLResponse else {
                    return Fail(error: APIError.unknown).eraseToAnyPublisher()
                }
                if (200...299).contains(response.statusCode){
                    return Just(response.statusCode).setFailureType(to: APIError.self).eraseToAnyPublisher()
                } else{
                    print(response)
                    return Fail(error: APIError.errorCode(response.statusCode)).eraseToAnyPublisher()
                }
            }.eraseToAnyPublisher()
    }
}
