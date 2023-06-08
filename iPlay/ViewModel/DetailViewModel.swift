//
//  DetailViewModel.swift
//  iPlay
//
//  Created by Muhammad Fakhryan on 08/06/23.
//

import Foundation
class DetailViewModel: ObservableObject {
    private let apiService: NetworkService = NetworkService()
    @Published internal var game: Game?
    @Published var id: Int

    init(id: Int) {
        self.id = id
    }

    func getGame() async {
        let network = apiService
        do{
            let game = try await network.getGame(id: id)
            DispatchQueue.main.async {
                self.game = game
            }
        }catch{
            fatalError("Error: connection failed")
        }
    }
}
