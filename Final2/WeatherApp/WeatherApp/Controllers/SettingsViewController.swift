//
//  SettingsViewController.swift
//  WeatherApp
//
//  Created by Аяулым Куат on 08.12.2025.
//

import UIKit

class SettingsViewController: UIViewController {
    @IBOutlet weak var notificationsSwitch: UISwitch!
    @IBOutlet weak var refreshSlider: UISlider!
    @IBOutlet weak var refreshValueLabel: UILabel!
    @IBOutlet weak var temperatureSegment: UISegmentedControl!
    @IBOutlet weak var favoritesTableView: UITableView!
    
    var favoriteArticles: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Settings"
        loadSettings()
        setupTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loadFavorites()
    }
    
    func setupTableView() {
        favoritesTableView.delegate = self
        favoritesTableView.dataSource = self
    }
    
    func loadSettings() {
        notificationsSwitch.isOn = UserDefaults.standard.bool(forKey: "notificationsEnabled")
        let refreshInterval = UserDefaults.standard.float(forKey: "refreshInterval")
        refreshSlider.value = refreshInterval > 0 ? refreshInterval : 30
        refreshValueLabel.text = "\(Int(refreshSlider.value))s"
        temperatureSegment.selectedSegmentIndex = UserDefaults.standard.integer(forKey: "temperatureUnit")
    }
    
    func loadFavorites() {
        favoriteArticles = UserDefaults.standard.stringArray(forKey: "favoriteArticles") ?? []
        favoritesTableView.reloadData()
    }
    
    @IBAction func notificationsSwitchChanged(_ sender: UISwitch) {
        UserDefaults.standard.set(sender.isOn, forKey: "notificationsEnabled")
        
        let message = sender.isOn ? "Notifications enabled" : "Notifications disabled"
        showToast(message: message)
    }
    
    @IBAction func refreshSliderChanged(_ sender: UISlider) {
        let value = Int(sender.value)
        refreshValueLabel.text = "\(value)s"
        UserDefaults.standard.set(Float(value), forKey: "refreshInterval")
    }
    
    @IBAction func temperatureSegmentChanged(_ sender: UISegmentedControl) {
        UserDefaults.standard.set(sender.selectedSegmentIndex, forKey: "temperatureUnit")
    }
    
    @IBAction func clearFavoritesButtonTapped(_ sender: UIButton) {
        let alert = UIAlertController(title: "Clear Favorites", message: "Are you sure you want to clear all favorites?", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        alert.addAction(UIAlertAction(title: "Clear", style: .destructive) { [weak self] _ in
            UserDefaults.standard.set([], forKey: "favoriteArticles")
            self?.loadFavorites()
            self?.showToast(message: "Favorites cleared")
        })
        present(alert, animated: true)
    }
    
    func showToast(message: String) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        present(alert, animated: true)
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            alert.dismiss(animated: true)
        }
    }
}

extension SettingsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favoriteArticles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FavoriteCell") ?? UITableViewCell(style: .default, reuseIdentifier: "FavoriteCell")
        cell.textLabel?.text = favoriteArticles[indexPath.row]
        cell.textLabel?.numberOfLines = 2
        cell.textLabel?.font = UIFont.systemFont(ofSize: 14)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if let url = URL(string: favoriteArticles[indexPath.row]) {
            UIApplication.shared.open(url)
        }
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            favoriteArticles.remove(at: indexPath.row)
            UserDefaults.standard.set(favoriteArticles, forKey: "favoriteArticles")
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
}
