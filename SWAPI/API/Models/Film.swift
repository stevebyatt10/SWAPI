//
//  Film.swift
//  SWAPI
//
//  Created by Stephen Byatt on 5/10/21.
//

import Foundation

public struct Film: Codable, Hashable {
    
    public var title: String?
    public var episode_id: Int?
    public var opening_crawl: String?
    public var director: String?
    public var producer: String?
    public var release_date: String?
    public var characters: [String]? // URL for character
    
    
    public enum CodingKeys: String, CodingKey, CaseIterable {
        case title
        case episode_id
        case opening_crawl
        case director
        case producer
        case release_date
        case characters
    }
    
    // Encodable protocol methods
    
    public func encode(to encoder: Encoder) throws {
        var encoderContainer = encoder.container(keyedBy: CodingKeys.self)
        try encoderContainer.encodeIfPresent(title, forKey: .title)
        try encoderContainer.encodeIfPresent(episode_id, forKey: .episode_id)
        try encoderContainer.encodeIfPresent(opening_crawl, forKey: .opening_crawl)
        try encoderContainer.encodeIfPresent(director, forKey: .director)
        try encoderContainer.encodeIfPresent(producer, forKey: .producer)
        try encoderContainer.encodeIfPresent(release_date, forKey: .release_date)
        try encoderContainer.encodeIfPresent(characters, forKey: .characters)
        
    }
    
    
    func getDate() -> Date? {
        guard let date = self.release_date else {
            return nil
        }
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter.date(from: date)
    }
    
    func getFormattedDate() -> String {
        guard let date = self.getDate() else {
            return "date"
        }
        let formatter = DateFormatter()
        formatter.dateFormat = "d MMMM, yyyy"
        
        return formatter.string(from: date)
        
    }
}
