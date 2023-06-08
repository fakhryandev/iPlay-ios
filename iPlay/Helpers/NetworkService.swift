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
        
        return gamesMapper(input: result.games)
    }
    
    func getGame(id: Int) async throws -> Game {
        let component = URLComponents(string: "\(baseUrl)/\(id)")!
        
        let request = URLRequest(url: component.url!)
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            fatalError("Error: Can't fetching data")
        }
        
        let decoder = JSONDecoder()
        let result = try decoder.decode(GameResponse.self, from: data)
        
        return gameMapper(input: result.self)
    }
}

extension NetworkService{
    fileprivate func gamesMapper(
        input gameResponses: [GameResponse]
    ) -> [Game]{
        return gameResponses.map{ result in
            return Game(
                id: result.id,
                name: result.name,
                backgroundImage: result.backgroundImage
            )
        }
    }
    
    fileprivate func gameMapper(
        input gameResponse: GameResponse
    ) -> Game{
        return Game(
            id: gameResponse.id,
            name: gameResponse.name,
            backgroundImage: gameResponse.backgroundImage
        )
    }
}
