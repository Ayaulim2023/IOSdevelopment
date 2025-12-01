//
//  ViewController.swift
//  HeroRandomizer
//
//  Created by Аяулым Куат on 01.12.2025.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var heroImageView: UIImageView!
    
    @IBOutlet weak var fullNameLabel: UILabel!
    @IBOutlet weak var intelligenceLabel: UILabel!
    @IBOutlet weak var strengthLabel: UILabel!
    @IBOutlet weak var speedLabel: UILabel!
    @IBOutlet weak var durabilityLabel: UILabel!
    @IBOutlet weak var powerLabel: UILabel!
    @IBOutlet weak var combatLabel: UILabel!
    @IBOutlet weak var placeOfBirthLabel: UILabel!
    @IBOutlet weak var firstAppearanceLabel: UILabel!
    var allHeroes: [Superhero] = []
        
        override func viewDidLoad() {
            super.viewDidLoad()
            fetchHeroes()
        }
        
        func fetchHeroes() {
            NetworkManager.shared.fetchAllHeroes { heroes in
                guard let heroes = heroes else {
                    DispatchQueue.main.async {
                        self.showError(message: "Failed to load superheroes.")
                    }
                    return
                }
                
                self.allHeroes = heroes
                
                DispatchQueue.main.async {
                    self.showRandomHero()
                }
            }
        }
        
        func showRandomHero() {
            guard !allHeroes.isEmpty else { return }
            
            let hero = allHeroes.randomElement()!
            
            nameLabel.text = "Name: \(hero.name)"
            fullNameLabel.text = "Full Name: \(hero.biography.fullName ?? "N/A")"
            intelligenceLabel.text = "Intelligence: \(hero.powerstats.intelligence ?? 0)"
            strengthLabel.text = "Strength: \(hero.powerstats.strength ?? 0)"
            speedLabel.text = "Speed: \(hero.powerstats.speed ?? 0)"
            durabilityLabel.text = "Durability: \(hero.powerstats.durability ?? 0)"
            powerLabel.text = "Power: \(hero.powerstats.power ?? 0)"
            combatLabel.text = "Combat: \(hero.powerstats.combat ?? 0)"
            placeOfBirthLabel.text = "Place of Birth: \(hero.biography.placeOfBirth ?? "N/A")"
            firstAppearanceLabel.text = "First Appearance: \(hero.biography.firstAppearance ?? "N/A")"
            
            loadHeroImage(from: hero.images.lg)
        }
        
        func loadHeroImage(from urlString: String) {
            guard let url = URL(string: urlString) else {
                heroImageView.image = UIImage(systemName: "person.fill")
                return
            }
            
            URLSession.shared.dataTask(with: url) { data, _, error in
                if let _ = error {
                    DispatchQueue.main.async {
                        self.heroImageView.image = UIImage(systemName: "person.fill")
                    }
                    return
                }
                
                if let data = data, let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        UIView.transition(with: self.heroImageView, duration: 0.3, options: .transitionCrossDissolve) {
                            self.heroImageView.image = image
                        }
                    }
                }
            }.resume()
        }
        
        func showError(message: String) {
            let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            present(alert, animated: true)
        }
        
        @IBAction func randomizeTapped(_ sender: UIButton) {
            showRandomHero()
        }
    
}

