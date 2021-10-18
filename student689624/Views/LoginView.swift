//
//  LoginView.swift
//  student689624
//
//  Created by user206790 on 10/18/21.
//

import SwiftUI

struct LoginView: View {
    @State private var username: String = ""
    @State private var password: String = ""

    private let localStorage: LocalStorage = .init()
    
    @StateObject var viewModel = LoginViewModelImpl(service: LoginServiceImpl())

    var body: some View {
        let authToken = localStorage.fetchAuthToken()
        switch authToken{
            case "":
                NavigationView{
                    VStack(alignment: .leading){
                        //Wellicht de smerigste manier ever om deze message te weergeven maar het werkt
                        switch viewModel.state{
                            case .failed:
                            Text("Onjuiste inloggegevens").foregroundColor(.red).padding(.bottom, 8)
                        case .noAttemptYet:
                            EmptyView().padding(.bottom, 8)
                        case .loading:
                            EmptyView().padding(.bottom, 8)
                        case .successLogin(content: _):
                            EmptyView().padding(.bottom, 8)
                        }
                        VStack(alignment: .leading){
                        Text("Gebruikersnaam")
                        TextField("Gebruikersnaam", text: $username)
                        }.padding(.bottom, 20)
                        VStack(alignment: .leading){
                            Text("Wachtwoord")
                            SecureField("Wachtwoord", text: $password)
                        }.padding(.bottom, 20)
                        Button("Login"){
                            self.viewModel.login(username: username, password: password)
                            username = ""
                            password = ""
                        }.padding(.vertical, 12).padding(.horizontal, 30).background(Color.blue).foregroundColor(.white).font(.system(size: 15, weight: .heavy)).cornerRadius(10)
                        Spacer()
                    }.padding(.leading, 50)
                }.navigationTitle("Login")
            default:
            NavigationView{
                Button("Logout"){
                    viewModel.logout()
                }
            }.navigationTitle("Profiel")
                
            
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
