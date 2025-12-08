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
        setupCollectionView()
        setupTextField()
        loadSavedCity()
        fetchWeather()
    }
    
    func setupCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 160, height: 160)
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
        showLoadingIndicator()
        
        NetworkManager.shared.fetchWeather(city: currentCity) { [weak self] result in
            DispatchQueue.main.async {
                self?.hideLoadingIndicator()
                
                switch result {
                case .success(let weatherResponse):
                    self?.weatherItems = weatherResponse.list
                    self?.collectionView.reloadData()
                    self?.title = "Weather: \(weatherResponse.city.name)"
                case .failure(let error):
                    self?.showError(message: error.localizedDescription)
                }
            }
        }
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
