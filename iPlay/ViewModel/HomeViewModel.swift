//
//  HomeViewModel.swift
//  iPlay
//
//  Created by Muhammad Fakhryan on 06/06/23.
//

import Foundation

class HomeViewModel: ObservableObject {
    private let apiService: NetworkService = NetworkService()
    @Published internal var games: [Game] = []
    
    init() {
        Task{
            await getGames()
        }
    }
    
    func getGames() async {
        let network = apiService
        do{
            let games = try await network.getGames()
            DispatchQueue.main.async {
                self.games = games
            }
        }catch{
            fatalError("Error: connection failed")
        }
    }
}
