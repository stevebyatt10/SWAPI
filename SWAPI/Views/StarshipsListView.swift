//
//  StarshipsListView.swift
//  SWAPI
//
//  Created by Stephen Byatt on 5/10/21.
//

import SwiftUI

struct StarshipsListView: View {
    @ObservedObject var model = StarshipsListViewModel()
    
    var body: some View {
        NavigationView {
            
            List() {
                if model.loading {
                    ProgressView()
                }
                else if model.ships.isEmpty{
                    Text("Could not fetch films")
                }
                
                ForEach(model.ships, id: \.url) { ship in
                    NavigationLink {
                        StarshipView(ship: ship)
                    } label: {
                        Text(ship.name ?? "Ship")
                    }
                }
            }
            .navigationBarTitle("Starships") // Seems to cause invalid constraints warning
        }
    }
}
struct StarshipsListView_Previews: PreviewProvider {
    static var previews: some View {
        StarshipsListView()
    }
}
