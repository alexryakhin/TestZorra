//
//  ContentView.swift
//  TestZorra
//
//  Created by Alexander Bonney on 7/7/21.
//

import SwiftUI
import Kingfisher

struct ContentView: View {
    
    @StateObject var vm = ViewModel()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(vm.beer, id: \.id) { item in
                    NavigationLink(destination: DetailView(name: item.name, description: item.description, imageURL: item.image_url)) {
                        HStack {
                            KFImage(URL(string: item.image_url))
                                .resizable()
                                .scaledToFit()
                                .frame(width: 50, height: 50)
                            Text(item.name)
                        }
                    }
                }
            }
            .navigationBarTitle("Beer")
            // MARK: refreshable works from iOS 15
//            .refreshable {
//                vm.fetchData()
//            }
            .onAppear {
                vm.fetchData()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
