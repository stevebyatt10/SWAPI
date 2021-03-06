//
//  ContentView.swift
//  SWAPI
//
//  Created by Stephen Byatt on 5/10/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            FilmsListView()
                .tabItem {
                    Image(systemName: "film")
                    Text("Films")
                }
           StarshipsListView()
                .tabItem {
                    Image(systemName: "airplane")
                    Text("Starships")
                }
        }
            
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
