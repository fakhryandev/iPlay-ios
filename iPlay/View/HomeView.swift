//
//  ContentView.swift
//  iPlay
//
//  Created by Muhammad Fakhryan on 06/06/23.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject private var viewModel: HomeViewModel
    
    init(viewModel: HomeViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        VStack {
            NavigationView{
                List(viewModel.games){ game in
                    NavigationLink(destination: DetailView(id: game.id)){
                        Text(game.name)
                    }
                }
            }
        }
        .padding()
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = HomeViewModel()
        HomeView(viewModel: viewModel)
    }
}
