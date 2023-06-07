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
                    HStack{
                        NavigationLink(destination: DetailView(title: game.name)){
                            Text(game.name)
                        }
                    }
                }
            }.navigationTitle("Tes")
            //            Image(systemName: "globe")
            //                .imageScale(.large)
            //                .foregroundColor(.accentColor)
            //            Text("Hello, world!")
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
