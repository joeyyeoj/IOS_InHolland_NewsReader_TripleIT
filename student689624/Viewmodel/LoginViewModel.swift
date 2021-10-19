//
//  LoginViewModel.swift
//  student689624
//
//  Created by user206790 on 10/18/21.
//

import Foundation
import Combine

protocol LoginViewModel{
    func login(username: String, password: String)
    func logout()
}

class LoginViewModelImpl: ObservableObject, LoginViewModel {
    private let service: LoginService
    private(set) var authtoken = ""
    private var cancellables = Set<AnyCancellable>()
    
    @Published private(set) var state: LoginResultState = .noAttemptYet
    
    init(service: LoginService){
        self.service = service
    }
    

    func login(username: String, password: String) {
        let localStorage: LocalStorage = .init()
        self.state = .loading
        let cancellable = service.request(from: .login(username: username, password: password))
            .sink {
                res in
                switch res{
                case .finished:
                    self.state = .successLogin(content: self.authtoken)
                    break
                case .failure(let error):
                    self.state = .failed(error: error)
                    break
                }
            } receiveValue: {
                (response) in self.authtoken = response.AuthToken
                localStorage.storeAuthToken(self.authtoken)
            }
        
        self.cancellables.insert(cancellable)
    }
    
    func logout(){
        let localStorage: LocalStorage = .init()
        self.state = .noAttemptYet
        localStorage.storeAuthToken("")
    }
}
