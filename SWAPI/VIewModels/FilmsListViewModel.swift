//
//  FilmsListViewModel.swift
//  SWAPI
//
//  Created by Stephen Byatt on 5/10/21.
//

import SwiftUI

class FilmListViewModel : ViewModel {
    @Published var films = [Film]()
    
    override init() {
        super.init()
        getFilms()
    }
    
    func getFilms() {
        loading = true
        
        SWAPI.getFilms { films in
            if let films = films {
                self.films = films.sorted(by: { this, other in
                    guard let thisDate = this.getDate(), let otherDate = other.getDate() else {
                        return true
                    }
                    return thisDate > otherDate
                    
                })
            }
            
            self.loading = false
        }
    }
}
