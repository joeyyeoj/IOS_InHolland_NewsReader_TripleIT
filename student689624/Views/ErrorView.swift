//
//  ErrorView.swift
//  student689624
//
//  Created by user206790 on 10/16/21.
//

import SwiftUI

struct ErrorView: View {
    
    

    typealias ErrorViewActionHandler = () -> Void
    
    let error: Error
    let handler: ErrorViewActionHandler
    
    internal init(error: Error,
                  handler:
                  @escaping ErrorView.ErrorViewActionHandler) {
        self.error = error
        self.handler = handler
    }
    
    var body: some View {
        VStack{
            Image(systemName: "exclamationmark.icloud.fill").foregroundColor(.gray).font(.system(size: 50, weight: .heavy)).padding(.bottom, 4)
            Text("Oepsie woepsie, er is iets misgegaan!")
            Text(error.localizedDescription).foregroundColor(.gray).font(.system(size: 15)).multilineTextAlignment(.center).padding(.vertical, 4)
            Button(action: {
                handler()
            }, label: {
                Text("Opnieuw proberen")
            })
                .padding(.vertical, 12)
                .padding(.horizontal, 30)
                .background(Color.blue)
                .foregroundColor(.white)
                .font(.system(size: 15, weight: .heavy))
                .cornerRadius(10)
            
        }
    }
}

struct ErrorView_Previews: PreviewProvider {
    static var previews: some View {
        ErrorView(error: APIError.decodingError){}.previewLayout(.sizeThatFits)
    }
}
