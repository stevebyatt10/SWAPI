//
//  StarshipViewModel.swift
//  SWAPI
//
//  Created by Stephen Byatt on 5/10/21.
//

import Foundation


class StarshipsViewModel : ViewModel {
    let ship : Starship
    @Published var pilots = [Person]()
    
    
    init(ship: Starship) {
        self.ship = ship
        super.init()

        getPilots()
        
    }
    
    func getPilots() {
        loading = true

        for pilot in ship.pilots ?? [] {
            SWAPI.getPerson(from: pilot) { person in
                if let person = person {
                    self.pilots.append(person)
                }
            }
        }
        loading = false
    }
    
}
