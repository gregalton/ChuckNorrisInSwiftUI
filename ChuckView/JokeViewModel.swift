//
//  JokeViewModel.swift
//  ChuckView
//
//  Created by Greg Alton on 1/26/24.
//

import Foundation

class JokeViewModel: ObservableObject {
    @Published var joke: Joke? = nil
    
    func fetchJoke() {
        guard let url = URL(string: "http://api.chucknorris.io/jokes/random") else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let data = data {
                if let joke = try? JSONDecoder().decode(Joke.self, from: data) {
                    DispatchQueue.main.async {
                        print(joke.value)
                        self.joke = joke
                    }
                }
            }
        }.resume()
    }
    
    struct Joke: Codable {
        let categories: [String]
        let createdAt: String
        let iconURL: String
        let id: String
        let updatedAt: String
        let url: String
        let value: String

        // Define coding keys to match the JSON keys
        enum CodingKeys: String, CodingKey {
            case categories
            case createdAt = "created_at"
            case iconURL = "icon_url"
            case id
            case updatedAt = "updated_at"
            case url
            case value
        }
    }
}
