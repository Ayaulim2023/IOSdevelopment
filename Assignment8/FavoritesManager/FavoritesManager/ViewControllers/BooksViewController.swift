//
//  BooksViewController.swift
//  FavoritesManager
//
//  Created by Аяулым Куат on 29.11.2025.
//

import UIKit

class BooksViewController: BaseFavoritesViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Books"
        tabBarItem = UITabBarItem(title: "Books", image: UIImage(systemName: "book"), selectedImage: UIImage(systemName: "book.fill"))
        items = BooksViewController.sampleBooks()
        tableView.reloadData()
    }

    static func sampleBooks() -> [FavoriteItem] {
        return [
            FavoriteItem(title: "1984 — George Orwell", description: "Dystopian novel exploring totalitarianism, surveillance, and freedom. Thought-provoking classic.", review: "Always makes me reflect on society.", imageName: "book"),
            FavoriteItem(title: "To Kill a Mockingbird — Harper Lee", description: "A story of racial injustice and childhood innocence. Emotional and powerful.", review: "Inspires empathy and understanding.", imageName: "book"),
            FavoriteItem(title: "The Great Gatsby — F. Scott Fitzgerald", description: "Tale of love, wealth, and the American Dream. Elegant prose.", review: "Beautifully written with deep symbolism.", imageName: "book"),
            FavoriteItem(title: "Harry Potter and the Sorcerer's Stone — J.K. Rowling", description: "The magical beginning of a beloved series. Adventure and friendship.", review: "Brings back childhood memories.", imageName: "book"),
            FavoriteItem(title: "The Hobbit — J.R.R. Tolkien", description: "Fantasy adventure of Bilbo Baggins journeying to reclaim treasure. Rich world-building.", review: "Epic storytelling that’s captivating.", imageName: "book"),
            FavoriteItem(title: "Pride and Prejudice — Jane Austen", description: "Classic romance and social commentary. Sharp wit and memorable characters.", review: "Love the character development.", imageName: "book"),
            FavoriteItem(title: "The Catcher in the Rye — J.D. Salinger", description: "Coming-of-age story exploring teenage angst and alienation. Iconic narrative voice.", review: "Captures adolescence perfectly.", imageName: "book"),
            FavoriteItem(title: "The Lord of the Rings — J.R.R. Tolkien", description: "Epic fantasy saga of good vs evil. Rich lore and unforgettable characters.", review: "Immersive and timeless.", imageName: "book"),
            FavoriteItem(title: "The Alchemist — Paulo Coelho", description: "Inspirational tale of a shepherd seeking his personal legend. Philosophical and uplifting.", review: "Motivates me to follow dreams.", imageName: "book"),
            FavoriteItem(title: "Moby-Dick — Herman Melville", description: "Epic sea adventure exploring obsession and fate. Deeply symbolic.", review: "A classic that challenges the mind.", imageName: "book")
        ]
    }
}
