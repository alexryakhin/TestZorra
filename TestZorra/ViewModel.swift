//
//  ViewModel.swift
//  TestZorra
//
//  Created by Alexander Bonney on 7/7/21.
//

import Foundation

class ViewModel: ObservableObject {
    
    @Published var beer = [Beer]()
    
    func fetchData() {
        guard let url = URL(string: "https://api.punkapi.com/v2/beers?page=2&per_page=80") else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                if let decoded = try? JSONDecoder().decode([Beer].self, from: data) {
                    DispatchQueue.main.async {
                        self.beer = decoded
                    }
                }
            }
        }.resume()
    }
    
    
}
