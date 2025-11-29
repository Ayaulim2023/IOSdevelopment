//
//  MoviesViewController.swift
//  FavoritesManager
//
//  Created by Аяулым Куат on 29.11.2025.
//

import UIKit

class MoviesViewController: BaseFavoritesViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Movies"
        tabBarItem = UITabBarItem(title: "Movies", image: UIImage(systemName: "film"), selectedImage: UIImage(systemName: "film.fill"))
        items = MoviesViewController.sampleMovies()
        tableView.reloadData()
    }

    static func sampleMovies() -> [FavoriteItem] {
        return [
            FavoriteItem(title: "The Shawshank Redemption", description: "Two imprisoned men bond over years, finding solace and eventual redemption through acts of common decency.", review: "A heartbreaking but uplifting story of hope.", imageName: "film"),
            FavoriteItem(title: "Inception", description: "A skilled extractor is given a chance to have his past crimes forgiven by implanting an idea into a target's subconscious.", review: "Layered and visually stunning; rewards rewatching.", imageName: "film"),
            FavoriteItem(title: "Pulp Fiction", description: "Interwoven crime stories unfold in Los Angeles with dark humor and memorable dialogue.", review: "Iconic and unpredictable.", imageName: "film"),
            FavoriteItem(title: "The Godfather", description: "A saga of a crime family’s rise and near-tragic consequences as power and loyalty clash.", review: "Masterpiece of filmmaking.", imageName: "film"),
            FavoriteItem(title: "Forrest Gump", description: "The life of a simple man who unwittingly influences several historic moments.", review: "Warm storytelling with emotional depth.", imageName: "film"),
            FavoriteItem(title: "Interstellar", description: "A team of explorers travel beyond our galaxy to save humanity.", review: "Grand, emotional, and scientifically intriguing.", imageName: "film"),
            FavoriteItem(title: "The Dark Knight", description: "Batman faces the Joker in a battle that tests his moral code.", review: "Gripping and intense; Heath Ledger is unforgettable.", imageName: "film"),
            FavoriteItem(title: "Fight Club", description: "A disillusioned man forms an underground fight club that evolves into something darker.", review: "Provocative and thought-provoking.", imageName: "film"),
            FavoriteItem(title: "Spirited Away", description: "A young girl navigates a magical world of spirits to save her parents.", review: "Beautifully animated and emotionally resonant.", imageName: "film"),
            FavoriteItem(title: "La La Land", description: "A modern musical about love and ambition in Los Angeles.", review: "Stylish, bittersweet, and full of charm.", imageName: "film")
        ]
    }
}
