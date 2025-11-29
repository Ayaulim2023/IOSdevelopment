//
//  CoursesViewController.swift
//  FavoritesManager
//
//  Created by Аяулым Куат on 29.11.2025.
//

import UIKit

class CoursesViewController: BaseFavoritesViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Courses"
        tabBarItem = UITabBarItem(title: "Courses", image: UIImage(systemName: "graduationcap"), selectedImage: UIImage(systemName: "graduationcap.fill"))
        items = CoursesViewController.sampleCourses()
        tableView.reloadData()
    }

    static func sampleCourses() -> [FavoriteItem] {
        return [
            FavoriteItem(title: "iOS Development — Udemy", description: "Learn Swift and UIKit to build real iOS apps. Hands-on projects included.", review: "Very practical and detailed course.", imageName: "graduationcap"),
            FavoriteItem(title: "Machine Learning — Coursera", description: "Introduction to ML algorithms and real-world applications. Great for beginners.", review: "Excellent explanation of concepts.", imageName: "graduationcap"),
            FavoriteItem(title: "Web Development Bootcamp — Udemy", description: "Full stack web development from HTML to Node.js. Interactive projects.", review: "Learned a lot about full stack workflows.", imageName: "graduationcap"),
            FavoriteItem(title: "Data Science — edX", description: "Comprehensive course covering Python, statistics, and data visualization. Practical exercises.", review: "Highly recommended for beginners.", imageName: "graduationcap"),
            FavoriteItem(title: "UI/UX Design Fundamentals — Coursera", description: "Learn the principles of user interface and experience design. Hands-on tasks.", review: "Very clear explanations and examples.", imageName: "graduationcap"),
            FavoriteItem(title: "Digital Marketing — LinkedIn Learning", description: "Covers SEO, content marketing, social media, and email campaigns. Practical exercises.", review: "Useful for building real skills.", imageName: "graduationcap"),
            FavoriteItem(title: "Python Programming — Codecademy", description: "Learn Python from scratch with exercises and mini projects. Interactive learning.", review: "Great for absolute beginners.", imageName: "graduationcap"),
            FavoriteItem(title: "Project Management — Coursera", description: "Basics of PM including Agile, Scrum, and traditional methods. Real case studies.", review: "Good for understanding project workflows.", imageName: "graduationcap"),
            FavoriteItem(title: "Artificial Intelligence — Udacity", description: "Intro to AI concepts, neural networks, and deep learning. Hands-on labs.", review: "Excellent overview and practice.", imageName: "graduationcap"),
            FavoriteItem(title: "Blockchain Basics — edX", description: "Understand blockchain technology, crypto, and smart contracts. Beginner friendly.", review: "Very informative and easy to follow.", imageName: "graduationcap")
        ]
    }
}
