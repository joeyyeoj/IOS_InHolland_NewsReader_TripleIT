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
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
