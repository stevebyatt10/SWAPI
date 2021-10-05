//
//  FilmsListView.swift
//  SWAPI
//
//  Created by Stephen Byatt on 5/10/21.
//

import SwiftUI

struct FilmsListView: View {
    @ObservedObject var model = FilmListViewModel()
    
    var body: some View {
        NavigationView {
            
            List() {
                if model.loading {
                    ProgressView()
                }
                else if model.films.isEmpty{
                    Text("Could not fetch films")
                }
                
                ForEach(model.films, id: \.episode_id) { film in
                    NavigationLink {
                        FilmView(film: film)
                    } label: {
                        VStack(alignment: .leading, spacing: 2) {
                            Text(film.title ?? "Film")
                                .font(.title2)
                            Text(film.getFormattedDate())
                                .font(.footnote)
                        }
                    }
                }
            }
            .navigationBarTitle("Films") // Seems to cause invalid constraints warning
        }
    }
}

struct FilmsListView_Previews: PreviewProvider {
    static var previews: some View {
        FilmsListView()
    }
}
