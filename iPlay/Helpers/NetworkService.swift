//
//  NetworkService.swift
//  iPlay
//
//  Created by Muhammad Fakhryan on 06/06/23.
//

import Foundation

class NetworkService {
    let baseUrl = "https://rawg-mirror.vercel.app/api/games"
    
    func getGames() async throws -> [Game] {
        let component = URLComponents(string: baseUrl)!
        
        let request = URLRequest(url: component.url!)
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            fatalError("Error: Can't fetching data")
        }
        
        let decoder = JSONDecoder()
        let result = try decoder.decode(GameResponses.self, from: data)
        
        return gameMapper(input: result.games)
    }
}

extension NetworkService{
    fileprivate func gameMapper(
        input gameResponses: [GameResponse]
    ) -> [Game]{
        return gameResponses.map{ result in
            return Game(
                name: result.name,
                        backgroundImage: result.backgroundImage
            )
        }
    }
}
