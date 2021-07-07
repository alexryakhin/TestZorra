//
//  DetailView.swift
//  TestZorra
//
//  Created by Alexander Bonney on 7/7/21.
//

import SwiftUI
import Kingfisher

struct DetailView: View {
    var name: String
    var description: String
    var imageURL: String
    
    var body: some View {
        ZStack {
            Color.mint.opacity(0.5).ignoresSafeArea()
            ScrollView {
                KFImage(URL(string: imageURL)).resizable().scaledToFit().padding().background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 15)).frame(height: 300)
                Text(description).padding().background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 15)).padding()
            }.navigationBarTitle(name, displayMode: .inline)
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            DetailView(name: "Baby Saison - B-Sides", description: "A hark back to the origins of Saison; slight spice and earthy notes with highlights of lemon and pepper make a beer that could quench the thirst of any seasonal worker.", imageURL: "https://images.punkapi.com/v2/keg.png")
        }
    }
}
