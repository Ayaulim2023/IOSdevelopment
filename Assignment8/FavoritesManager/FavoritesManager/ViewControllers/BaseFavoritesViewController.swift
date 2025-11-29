//
//  BaseFavoritesViewController.swift
//  FavoritesManager
//
//  Created by Аяулым Куат on 29.11.2025.
//

import UIKit

class BaseFavoritesViewController: UIViewController {
    let tableView = UITableView(frame: .zero, style: .plain)
    var items: [FavoriteItem] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupTableView()
    }

    private func setupTableView() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])

        tableView.register(FavoriteCell.self, forCellReuseIdentifier: FavoriteCell.reuseIdentifier)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = 80
        tableView.tableFooterView = UIView()
    }

    func itemFor(indexPath: IndexPath) -> FavoriteItem {
        return items[indexPath.row]
    }
}

extension BaseFavoritesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { items.count }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        guard let cell = tableView.dequeueReusableCell(withIdentifier: FavoriteCell.reuseIdentifier, for: indexPath) as? FavoriteCell else {
            return UITableViewCell()
        }
        let item = items[indexPath.row]
        cell.configure(with: item)
        return cell
    }
}

extension BaseFavoritesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = itemFor(indexPath: indexPath)
        let detailVC = DetailViewController(item: item)
        navigationController?.pushViewController(detailVC, animated: true)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
