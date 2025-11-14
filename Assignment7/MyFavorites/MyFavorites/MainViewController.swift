//
//  MainViewController.swift
//  MyFavorites
//
//  Created by Аяулым Куат on 14.11.2025.
//
import UIKit

class MainViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!

    let sectionTitles = ["Favorite Movies", "Favorite Music", "Favorite Books", "Favorite Courses"]

    let favorites: [[FavoriteItem]] = [
        [
            FavoriteItem(title: "Inception", subtitle: "Christopher Nolan", review: "Mind-bending thriller", imageName: "film"),
            FavoriteItem(title: "Interstellar", subtitle: "Christopher Nolan", review: "Visually stunning sci-fi", imageName: "film"),
            FavoriteItem(title: "The Dark Knight", subtitle: "Christopher Nolan", review: "Iconic superhero movie", imageName: "film"),
            FavoriteItem(title: "Parasite", subtitle: "Bong Joon-ho", review: "Masterful storytelling", imageName: "film"),
            FavoriteItem(title: "La La Land", subtitle: "Damien Chazelle", review: "Magical and emotional", imageName: "film")
        ],
        [
            FavoriteItem(title: "Bohemian Rhapsody", subtitle: "Queen", review: "Legendary song", imageName: "music.note"),
            FavoriteItem(title: "Hotel California", subtitle: "Eagles", review: "Classic rock masterpiece", imageName: "music.note"),
            FavoriteItem(title: "Thriller", subtitle: "Michael Jackson", review: "Timeless hit", imageName: "music.note"),
            FavoriteItem(title: "Hey Jude", subtitle: "The Beatles", review: "Pure emotion", imageName: "music.note"),
            FavoriteItem(title: "Under Pressure", subtitle: "Queen & David Bowie", review: "Iconic collaboration", imageName: "music.note")
        ],
        [
            FavoriteItem(title: "1984", subtitle: "George Orwell", review: "Chilling dystopia", imageName: "book"),
            FavoriteItem(title: "To Kill a Mockingbird", subtitle: "Harper Lee", review: "Profound and moving", imageName: "book"),
            FavoriteItem(title: "The Alchemist", subtitle: "Paulo Coelho", review: "Inspirational story", imageName: "book"),
            FavoriteItem(title: "Harry Potter", subtitle: "J.K. Rowling", review: "Childhood favorite", imageName: "book"),
            FavoriteItem(title: "Pride and Prejudice", subtitle: "Jane Austen", review: "Timeless romance", imageName: "book")
        ],
        [ 
            FavoriteItem(title: "Software Engineering", subtitle: "3rd year", review: "Learned real-world skills", imageName: "book.closed"),
            FavoriteItem(title: "Data Structures", subtitle: "2nd year", review: "Built logical thinking", imageName: "book.closed"),
            FavoriteItem(title: "Cognitive Science", subtitle: "Elective", review: "Mind-blowing concepts", imageName: "book.closed"),
            FavoriteItem(title: "UX/UI Design", subtitle: "4th year", review: "Loved creativity", imageName: "book.closed"),
            FavoriteItem(title: "Databases", subtitle: "2nd year", review: "Structured my thinking", imageName: "book.closed")
        ]
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "My Favorites"
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 100
    }
}

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionTitles.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favorites[section].count
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionTitles[section]
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "FavoriteCell", for: indexPath) as? FavoriteCell else {
            return UITableViewCell()
        }
        let item = favorites[indexPath.section][indexPath.row]
        cell.configure(with: item)
        return cell
    }
}

