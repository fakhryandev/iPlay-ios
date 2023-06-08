//
//  Game.swift
//  iPlay
//
//  Created by Muhammad Fakhryan on 06/06/23.
//

import Foundation

class Game: Identifiable {
    let id: Int
    let name: String
    let backgroundImage: URL
    
    init(id: Int ,name: String, backgroundImage: URL) {
        self.id = id
        self.name = name
        self.backgroundImage = backgroundImage
    }
}

struct GameResponses: Codable {
    let games: [GameResponse]
    
    enum CodingKeys: String, CodingKey {
        case games = "results"
    }
}

struct GameResponse: Codable {
    let id: Int
    let name: String
    let backgroundImage: URL
    
    enum CodingKeys: String, CodingKey {
        case name
        case backgroundImage = "background_image"
        case id
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        let backgroundImageUrl = try container.decode(String.self, forKey: .backgroundImage)
        backgroundImage = URL(string: backgroundImageUrl)!
        
        name = try container.decode(String.self, forKey: .name)
        id = try container.decode(Int.self, forKey: .id)
    }
}
