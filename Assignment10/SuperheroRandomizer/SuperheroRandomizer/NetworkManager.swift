//
//  NetworkManager.swift
//  SuperheroRandomizer
//
//  Created by Аяулым Куат on 01.12.2025.
//

import Foundation
import Alamofire

class NetworkManager {
    static let shared = NetworkManager()
    private init() {}
    
    func fetchAllHeroes(completion: @escaping ([Superhero]?) -> Void) {
        let url = "https://akabab.github.io/superhero-api/api/all.json"
        
        AF.request(url).responseData { response in
            switch response.result {
            case .success(let data):
                do {
                    let heroes = try JSONDecoder().decode([Superhero].self, from: data)
                    completion(heroes)
                } catch {
                    print("Decoding error:", error)
                    completion(nil)
                }
            case .failure(let error):
                print("Network error:", error)
                completion(nil)
            }
        }
    }
}
