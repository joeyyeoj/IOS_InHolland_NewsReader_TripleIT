//
//  LoginService.swift
//  student689624
//
//  Created by user206790 on 10/18/21.
//

import Foundation
import Combine

struct LoginResponse: Codable {
    let AuthToken: String
}

struct LoginBody: Encodable {
    let UserName: String
    let Password: String
    
    enum CodingKeys: String, CodingKey{
        case UserName = "UserName"
        case Password = "Password"
        
    }
}

protocol LoginService {
    func request(from endpoint: NewsAPI) -> AnyPublisher<LoginResponse, APIError>
}

struct LoginServiceImpl: LoginService {
    
    func request(from endpoint: NewsAPI) -> AnyPublisher<LoginResponse, APIError> {
        return URLSession
            .shared
            .dataTaskPublisher(for: endpoint.urlRequest)
            .receive(on: DispatchQueue.main)
            .mapError { _ in APIError.unknown}
            .flatMap { data, response -> AnyPublisher<LoginResponse, APIError> in
               
                guard let response = response as? HTTPURLResponse else {
                    return Fail(error: APIError.unknown).eraseToAnyPublisher()
                }
                
                if (200...299).contains(response.statusCode){

                    return Just(data)
                        .decode(type: LoginResponse.self, decoder: JSONDecoder()).mapError {
                            _ in APIError.decodingError
                        }.eraseToAnyPublisher()
                } else{
                    print(response)
                    return Fail(error: APIError.errorCode(response.statusCode)).eraseToAnyPublisher()
                }
                
            }
            .eraseToAnyPublisher()
    }
}
