//
//  NetworkManager.swift
//  HeroRandomizer
//
//  Created by Аяулым Куат on 01.12.2025.
//
import Foundation

class NetworkManager {
    static let shared = NetworkManager()
    private init() {}

    func fetchAllHeroes(completion: @escaping ([Superhero]?) -> Void) {
        let urlString = "https://akabab.github.io/superhero-api/api/all.json"
        guard let url = URL(string: urlString) else { completion(nil); return }

        URLSession.shared.dataTask(with: url) { data, response, error in
            if let _ = error { completion(nil); return }
            guard let data = data else { completion(nil); return }

            do {
                let heroes = try JSONDecoder().decode([Superhero].self, from: data)
                completion(heroes)
            } catch {
                print("Decoding error:", error)
                completion(nil)
            }
        }.resume()
    }
}

