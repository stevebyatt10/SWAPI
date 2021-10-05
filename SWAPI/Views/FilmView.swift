//
//  FilmView.swift
//  SWAPI
//
//  Created by Stephen Byatt on 5/10/21.
//

import SwiftUI

struct FilmView: View {
    let film : Film
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 5) {
                
                Text("Released")
                    .font(.title)
                Text(film.getFormattedDate())
                    .padding(.bottom)

                Text("Director")
                    .font(.title)
                Text(film.director ?? "Director")
                    .padding(.bottom)

                Text("Producers")
                    .font(.title)
                Text(film.producer ?? "Producer")
                    .padding(.bottom)

                Text("Summary")
                    .font(.title)
                Text(film.opening_crawl ?? "Opening Crawl")
                    .padding(.bottom)
            }
            .padding()
            .frame(
                minWidth: 0,
                maxWidth: .infinity,
                minHeight: 0,
                maxHeight: .infinity,
                alignment: .topLeading
            )
            .navigationTitle(film.title ?? "Film")
        }
    }
}
