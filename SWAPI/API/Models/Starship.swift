//
//  Starship.swift
//  SWAPI
//
//  Created by Stephen Byatt on 5/10/21.
//

import Foundation


public struct Starship: Codable, Hashable {
    
    public var name: String?
    public var model: String?
    public var manufacturer: String?
    public var cost_in_credits: String?
    public var length: String?
    public var max_atmosphering_speed: String?
    public var crew: String?
    public var passengers: String?
    public var cargo_capacity: String?
    public var consumables: String?
    public var hyperdrive_rating: String?
    public var MGLT: String?
    public var starship_class: String?
    public var pilots: [String]? // URL of pilots
    public var url: String?


    
    public enum CodingKeys: String, CodingKey, CaseIterable {
        case name
        case model
        case manufacturer
        case cost_in_credits
        case length
        case max_atmosphering_speed
        case crew
        case passengers
        case cargo_capacity
        case consumables
        case hyperdrive_rating
        case MGLT
        case starship_class
        case pilots
        case url
    }
    
    // Encodable protocol methods
    
    public func encode(to encoder: Encoder) throws {
        var encoderContainer = encoder.container(keyedBy: CodingKeys.self)
        try encoderContainer.encodeIfPresent(name, forKey: .name)
        try encoderContainer.encodeIfPresent(model, forKey: .model)
        try encoderContainer.encodeIfPresent(manufacturer, forKey: .manufacturer)
        try encoderContainer.encodeIfPresent(cost_in_credits, forKey: .cost_in_credits)
        try encoderContainer.encodeIfPresent(length, forKey: .length)
        try encoderContainer.encodeIfPresent(max_atmosphering_speed, forKey: .max_atmosphering_speed)
        try encoderContainer.encodeIfPresent(passengers, forKey: .passengers)
        try encoderContainer.encodeIfPresent(cargo_capacity, forKey: .cargo_capacity)
        try encoderContainer.encodeIfPresent(consumables, forKey: .consumables)
        try encoderContainer.encodeIfPresent(hyperdrive_rating, forKey: .hyperdrive_rating)
        try encoderContainer.encodeIfPresent(MGLT, forKey: .MGLT)
        try encoderContainer.encodeIfPresent(starship_class, forKey: .starship_class)
        try encoderContainer.encodeIfPresent(pilots, forKey: .pilots)
        try encoderContainer.encodeIfPresent(url, forKey: .url)
    }
    
    func getLength() -> Double {
        guard var length = self.length else {
            return 0
        }
        
        // Remove characters that should not be there
        length.removeAll { c in
            return c == ","
        }
        let len = Double(length) ?? 0
        print(len)
        return len
    }
    
}
