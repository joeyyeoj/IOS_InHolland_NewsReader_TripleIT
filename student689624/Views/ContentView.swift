//
//  ContentView.swift
//  student689624
//
//  Created by user206790 on 10/14/21.
//

import SwiftUI

struct ContentView: View {
   
    
    
    var body: some View {
            NavigationView{
                    NewsListView(feedId: 0)
                        .navigationTitle(Text("Nieuws"))
                        .navigationBarItems(
                        leading:
                            NavigationLink(destination: FilterView()) {
                                Text("Filter")
                        },
                        trailing:
                            NavigationLink(destination: LoginView()) {
                                Image(systemName: "person.fill")
                })
            }
        }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
