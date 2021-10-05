//
//  StarshipView.swift
//  SWAPI
//
//  Created by Stephen Byatt on 5/10/21.
//

import SwiftUI

struct StarshipView: View {
    
    @ObservedObject var model : StarshipsViewModel
    
    init(ship : Starship) {
        self.model = StarshipsViewModel(ship: ship)
    }
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 5) {
                Group {
                    Text("Model")
                        .font(.title)
                    Text(model.ship.model ?? "model")
                        .padding(.bottom)
                    
                    Text("Manufacturer")
                        .font(.title)
                    Text(model.ship.manufacturer ?? "Manufacturer")
                        .padding(.bottom)
                    
                    if !model.pilots.isEmpty {
                        Text("Pilots")
                            .font(.title)
                        VStack(alignment: .leading) {
                            ForEach(model.pilots, id: \.self) { pilot in
                                Text("• \(pilot.name ?? "pilot")")
                            }
                        }
                        .padding(.bottom)
                    }
                    
                    Text("Cost in credits")
                        .font(.title)
                    Text(model.ship.cost_in_credits ?? "Cost")
                        .padding(.bottom)
                    
                    Text("Length")
                        .font(.title)
                    Text("\(model.ship.getLength())")
                        .padding(.bottom)
                }
                
                Group {
                    Text("Max atmosphering speed")
                        .font(.title)
                    Text(model.ship.max_atmosphering_speed ?? "speed")
                        .padding(.bottom)
                    
                    Text("Crew")
                        .font(.title)
                    Text(model.ship.crew ?? "crew")
                        .padding(.bottom)
                    
                    Text("Passengers")
                        .font(.title)
                    Text(model.ship.passengers ?? "length")
                        .padding(.bottom)
                    
                    Text("Cargo Capacity")
                        .font(.title)
                    Text(model.ship.cargo_capacity ?? "capacity")
                        .padding(.bottom)
                    
                    Text("Consumables")
                        .font(.title)
                    Text(model.ship.consumables ?? "consumables")
                        .padding(.bottom)
                }
                Group {
                    Text("Hyperdrive Rating")
                        .font(.title)
                    Text(model.ship.hyperdrive_rating ?? "Rating")
                        .padding(.bottom)
                    
                    Text("MGLT")
                        .font(.title)
                    Text(model.ship.MGLT ?? "MGLT")
                        .padding(.bottom)
                    
                    Text("Class")
                        .font(.title)
                    Text(model.ship.starship_class ?? "class")
                        .padding(.bottom)
                    
                }
                
            }
            .padding()
            .frame(
                minWidth: 0,
                maxWidth: .infinity,
                minHeight: 0,
                maxHeight: .infinity,
                alignment: .topLeading
            )
            .navigationTitle(model.ship.name ?? "Ship")
        }
    }
    
    
}


