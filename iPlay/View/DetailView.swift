//
//  DetailView.swift
//  iPlay
//
//  Created by Muhammad Fakhryan on 07/06/23.
//

import SwiftUI

struct DetailView: View {
    var title: String
    
    var body: some View {
        Text(title)
    }
}

    struct DetailView_Previews: PreviewProvider {
        static var previews: some View {
            DetailView(title: "Temp")
        }
    }
