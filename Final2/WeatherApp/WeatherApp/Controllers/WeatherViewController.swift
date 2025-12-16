//
//  WeatherViewController.swift
//  WeatherApp
//
//  Created by Аяулым Куат on 08.12.2025.
//

import UIKit

class WeatherViewController: UIViewController {
    @IBOutlet weak var cityTextField: UITextField!
    @IBOutlet weak var collectionView: UICollectionView!
        
        var weatherItems: [WeatherItem] = []
        var currentCity: String = "London"
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            title = "Weather Forecast"
            navigationController?.navigationBar.prefersLargeTitles = true
            
            setupCollectionView()
            setupTextField()
            loadSavedCity()
        }
        
        override func viewDidAppear(_ animated: Bool) {
            super.viewDidAppear(animated)
            
            if weatherItems.isEmpty {
                fetchWeather()
            }
        }
        
        func setupCollectionView() {
            collectionView.delegate = self
            collectionView.dataSource = self
            
            let layout = UICollectionViewFlowLayout()
            layout.itemSize = CGSize(width: 180, height: 200)
            layout.minimumInteritemSpacing = 10
            layout.minimumLineSpacing = 10
            layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
            collectionView.collectionViewLayout = layout
        }
        
        func setupTextField() {
            cityTextField.delegate = self
            cityTextField.text = currentCity
        }
        
        func loadSavedCity() {
            if let savedCity = UserDefaults.standard.string(forKey: "lastCity") {
                currentCity = savedCity
                cityTextField.text = savedCity
            }
        }
        
        func saveCity() {
            UserDefaults.standard.set(currentCity, forKey: "lastCity")
        }
        
        @IBAction func searchButtonTapped(_ sender: UIButton) {
            searchWeather()
        }
        
        func searchWeather() {
            guard let city = cityTextField.text, !city.isEmpty else {
                showError(message: "Please enter a city name")
                return
            }
            
            currentCity = city
            saveCity()
            cityTextField.resignFirstResponder()
            fetchWeather()
        }
        
        func fetchWeather() {
            print("🌤️ Fetching weather for: \(currentCity)")
            
            NetworkManager.shared.fetchWeather(city: currentCity) { [weak self] result in
                DispatchQueue.main.async {
                    switch result {
                    case .success(let weatherResponse):
                        print("✅ Weather data received: \(weatherResponse.list.count) items")
                        self?.weatherItems = weatherResponse.list
                        self?.collectionView.reloadData()
                        self?.title = "Weather: \(weatherResponse.city.name)"
                        
                    case .failure(let error):
                        print("❌ Weather error: \(error.localizedDescription)")
                        // Only show error if view is visible
                        if self?.isViewLoaded == true && self?.view.window != nil {
                            self?.showError(message: "Could not load weather for \(self?.currentCity ?? "city")")
                        }
                    }
                }
            }
        }
        
        func showError(message: String) {
            let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            present(alert, animated: true)
        }
    }

    extension WeatherViewController: UICollectionViewDelegate, UICollectionViewDataSource {
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return weatherItems.count
        }
        
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "WeatherCell", for: indexPath) as! WeatherCollectionViewCell
            cell.configure(with: weatherItems[indexPath.item])
            cell.layer.cornerRadius = 10
            cell.layer.borderWidth = 1
            cell.layer.borderColor = UIColor.systemGray4.cgColor
            return cell
        }
    }

    extension WeatherViewController: UITextFieldDelegate {
        func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            searchWeather()
            return true
        }
    }
