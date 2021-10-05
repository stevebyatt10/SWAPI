//
//  Person.swift
//  SWAPI
//
//  Created by Stephen Byatt on 5/10/21.
//

import Foundation

public struct Person: Codable, Hashable {
    
    public var name: String?


    
    public enum CodingKeys: String, CodingKey, CaseIterable {
        case name
    }
    
    // Encodable protocol methods
    
    public func encode(to encoder: Encoder) throws {
        var encoderContainer = encoder.container(keyedBy: CodingKeys.self)
        try encoderContainer.encodeIfPresent(name, forKey: .name)
        
    }
    
}
