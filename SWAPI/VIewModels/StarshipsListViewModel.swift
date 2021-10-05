//
//  StarshipsListViewModel.swift
//  SWAPI
//
//  Created by Stephen Byatt on 5/10/21.
//

import SwiftUI

class StarshipsListViewModel : ViewModel {
    @Published var ships = [Starship]()
    
    @State var previousPage : String?
    @State var nextPage : String?
    
    override init() {
        super.init()
        loading = true
        
        let path = SWAPI.basePath + "starships"
        getships(path: path)
    }
    
    func getships(path: String) {

        SWAPI.getStarshipsForPage(pageURL: path, handler: shipHandler)
        
    }
    
    func shipHandler(next: String?, ships: [Starship]) {
        self.ships.append(contentsOf: ships)
      
        if let next = next {
            getships(path: next)
        }
        else {
            self.ships.sort { this, other in
                return this.getLength() < other.getLength()
            }
            loading = false
        }
    }
}
