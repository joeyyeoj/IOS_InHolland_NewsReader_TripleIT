//
//  RegisterViewmodel.swift
//  student689624
//
//  Created by user206790 on 10/19/21.
//

import Foundation
import Combine

protocol RegisterViewModel{
    func register(username: String, password: String)
    
}

class RegisterViewModelImpl: ObservableObject, RegisterViewModel {
    private let service: RegisterService
    private var cancellables = Set<AnyCancellable>()
    private(set) var response = RegisterResponse(Success: false, Message: "")
    
    @Published private(set) var state: RegisterResultState = .noAttemptYet
    
    init(service: RegisterService){
        self.service = service
        
    }
    

    func register(username: String, password: String) {
        self.state = .loading
        let cancellable = service.request(from: .register(username: username, password: password))
            .sink {
                res in
                switch res{
                case .finished:
                    self.state = .successRegister(content: self.response)
                    break
                case .failure(let error):
                    self.state = .failed(error: error)
                    break
                }
            } receiveValue: {
                (response) in self.response = response
            }
        
        self.cancellables.insert(cancellable)
    }
}
