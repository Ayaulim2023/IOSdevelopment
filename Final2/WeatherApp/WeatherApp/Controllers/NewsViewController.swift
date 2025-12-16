//
//  NewsViewController.swift
//  WeatherApp
//
//  Created by Аяулым Куат on 08.12.2025.
//

import UIKit

class NewsViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    var articles: [NewsArticle] = []
    var favoriteArticles: [String] = [] // URLs of favorite articles
    let refreshControl = UIRefreshControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Add large title
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "Top News"
        
        // Custom navigation bar color
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .systemBackground
        appearance.largeTitleTextAttributes = [
            .foregroundColor: UIColor.label,
            .font: UIFont.systemFont(ofSize: 34, weight: .bold)
        ]
        
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        
        setupTableView()
        loadFavorites()
        fetchNews()
    }
    
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 200
        tableView.separatorStyle = .none // Remove default separators
        tableView.backgroundColor = .systemGroupedBackground // Better background
        
        // Styled refresh control
        refreshControl.tintColor = .systemBlue
        refreshControl.attributedTitle = NSAttributedString(
            string: "Pull to refresh news",
            attributes: [.foregroundColor: UIColor.secondaryLabel]
        )
        refreshControl.addTarget(self, action: #selector(refreshNews), for: .valueChanged)
        tableView.refreshControl = refreshControl
    }
    
//    @objc func refreshNews() {
//        fetchNews()
//    }
//    
    func fetchNews() {
        // Show loading indicator (only if not already refreshing)
        if !refreshControl.isRefreshing {
            showLoadingIndicator()
        }
        
        NetworkManager.shared.fetchNews { [weak self] result in
            DispatchQueue.main.async {
                // IMPORTANT: Hide loading on main thread
                self?.hideLoadingIndicator()
                self?.refreshControl.endRefreshing()  // Stop the spinner
                
                switch result {
                case .success(let articles):
                    print("✅ Fetched \(articles.count) articles")  // Debug
                    self?.articles = articles
                    self?.tableView.reloadData()  // Refresh the table
                    
                case .failure(let error):
                    print("❌ Error: \(error.localizedDescription)")  // Debug
                    self?.showError(message: error.localizedDescription)
                }
            }
        }
    }

    @objc func refreshNews() {
        print("🔄 Pull to refresh triggered")  // Debug
        fetchNews()
    }
    
    func loadFavorites() {
        favoriteArticles = UserDefaults.standard.stringArray(forKey: "favoriteArticles") ?? []
    }
    
    func saveFavorites() {
        UserDefaults.standard.set(favoriteArticles, forKey: "favoriteArticles")
    }
    
    func showLoadingIndicator() {
        let alert = UIAlertController(title: nil, message: "Loading...", preferredStyle: .alert)
        let loadingIndicator = UIActivityIndicatorView(frame: CGRect(x: 10, y: 5, width: 50, height: 50))
        loadingIndicator.hidesWhenStopped = true
        loadingIndicator.style = .medium
        loadingIndicator.startAnimating()
        alert.view.addSubview(loadingIndicator)
        present(alert, animated: true, completion: nil)
    }
    
    func hideLoadingIndicator() {
        dismiss(animated: true, completion: nil)
    }
    
    func showError(message: String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }
}

extension NewsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NewsCell", for: indexPath) as! NewsTableViewCell
        cell.configure(with: articles[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let article = articles[indexPath.row]
        
        // Open in Safari
        if let url = URL(string: article.url) {
            UIApplication.shared.open(url)
        }
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let article = articles[indexPath.row]
        let isFavorite = favoriteArticles.contains(article.url)
        
        let favoriteAction = UIContextualAction(style: .normal, title: isFavorite ? "Unfavorite" : "Favorite") { [weak self] _, _, completionHandler in
            if isFavorite {
                self?.favoriteArticles.removeAll { $0 == article.url }
            } else {
                self?.favoriteArticles.append(article.url)
            }
            self?.saveFavorites()
            completionHandler(true)
        }
        favoriteAction.backgroundColor = .systemBlue
        
        return UISwipeActionsConfiguration(actions: [favoriteAction])
    }
}
