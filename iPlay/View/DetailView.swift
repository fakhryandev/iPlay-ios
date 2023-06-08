//
//  DetailView.swift
//  iPlay
//
//  Created by Muhammad Fakhryan on 07/06/23.
//

import SwiftUI

struct DetailView: View {
    @StateObject var viewModel: DetailViewModel
    
    init(id: Int) {
        _viewModel = StateObject(wrappedValue: DetailViewModel(id: id))
    }
    
    var body: some View {
        VStack{
            if let game = viewModel.game{
                Text(game.name)
            }else{
                Text("Tunggu")
            }
        }
        .navigationTitle("Detail")
        .onAppear{
            Task{
                await viewModel.getGame()
            }
        }
    }
}

//    struct DetailView_Previews: PreviewProvider {
//        static var previews: some View {
//            DetailView(id: 3428)
//        }
//    }
