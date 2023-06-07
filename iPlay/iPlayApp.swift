//
//  iPlayApp.swift
//  iPlay
//
//  Created by Muhammad Fakhryan on 06/06/23.
//

import SwiftUI

@main
struct iPlayApp: App {
    var body: some Scene {
        WindowGroup {
            HomeView(viewModel: HomeViewModel())
        }
    }
}
