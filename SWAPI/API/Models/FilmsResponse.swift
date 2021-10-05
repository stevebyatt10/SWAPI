//
//  FilmList.swift
//  SWAPI
//
//  Created by Stephen Byatt on 5/10/21.
//

import Foundation


public struct FilmsResponse: Codable, Hashable {

    public var count: Int?
    public var next: String?
    public var previous: String?
    public var results: [Film]?


    public enum CodingKeys: String, CodingKey, CaseIterable {
        case count
        case next
        case previous
        case results
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var encoderContainer = encoder.container(keyedBy: CodingKeys.self)
        try encoderContainer.encodeIfPresent(count, forKey: .count)
        try encoderContainer.encodeIfPresent(next, forKey: .next)
        try encoderContainer.encodeIfPresent(previous, forKey: .previous)
        try encoderContainer.encodeIfPresent(results, forKey: .results)

    }
}
