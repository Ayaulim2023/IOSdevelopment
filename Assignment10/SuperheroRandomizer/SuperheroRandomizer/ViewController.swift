//
//  ViewController.swift
//  SuperheroRandomizer
//
//  Created by Аяулым Куат on 01.12.2025.
//

import UIKit
import Kingfisher

class ViewController: UIViewController {

    @IBOutlet weak var heroImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var fullNameLabel: UILabel!
    @IBOutlet weak var intelligenceLabel: UILabel!
    @IBOutlet weak var strengthLabel: UILabel!
    @IBOutlet weak var speedLabel: UILabel!
    @IBOutlet weak var powerLabel: UILabel!
    @IBOutlet weak var durabilityLabel: UILabel!
    @IBOutlet weak var combatLabel: UILabel!
    @IBOutlet weak var raceLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var placeOfBirthLabel: UILabel!
    @IBOutlet weak var alignmentLabel: UILabel!

    
    var allHeroes: [Superhero] = []
    var currentHero: Superhero?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadLastHero()
        fetchHeroes()
    }
    
    func fetchHeroes() {
        NetworkManager.shared.fetchAllHeroes { heroes in
            guard let heroes = heroes else { return }
            self.allHeroes = heroes
            
            // If no saved hero, show random
            if self.currentHero == nil {
                DispatchQueue.main.async {
                    self.showRandomHero()
                }
            }
        }
    }
    
    func showRandomHero() {
        guard !allHeroes.isEmpty else { return }
        
        let hero = allHeroes.randomElement()!
        self.currentHero = hero
        display(hero: hero)
        saveHero(hero)
    }
    
    func display(hero: Superhero) {
        nameLabel.text = "Name: \(hero.name)"
        fullNameLabel.text = "Full Name: \(hero.biography.fullName ?? "N/A")"
        intelligenceLabel.text = "Intelligence: \(hero.powerstats.intelligence ?? 0)"
        strengthLabel.text = "Strength: \(hero.powerstats.strength ?? 0)"
        speedLabel.text = "Speed: \(hero.powerstats.speed ?? 0)"
        powerLabel.text = "Power: \(hero.powerstats.power ?? 0)"
        durabilityLabel.text = "Durability: \(hero.powerstats.durability ?? 0)"
        combatLabel.text = "Combat: \(hero.powerstats.combat ?? 0)"
        raceLabel.text = "Race: \(hero.appearance.race ?? "N/A")"
        genderLabel.text = "Gender: \(hero.appearance.gender ?? "N/A")"
        placeOfBirthLabel.text = "Place of Birth: \(hero.biography.placeOfBirth ?? "N/A")"
        alignmentLabel.text = "Alignment: \(hero.biography.alignment ?? "N/A")"
        
        if let url = URL(string: hero.images.lg) {
            heroImageView.kf.setImage(with: url, placeholder: UIImage(systemName: "person.fill"))
        }
    }
    
    func saveHero(_ hero: Superhero) {
        UserDefaults.standard.set(hero.id, forKey: "lastHeroID")
    }
    
    func loadLastHero() {
        let savedID = UserDefaults.standard.integer(forKey: "lastHeroID")
        guard savedID != 0 else { return }
        
        // If we already fetched all heroes, display saved hero
        if let hero = allHeroes.first(where: { $0.id == savedID }) {
            currentHero = hero
            DispatchQueue.main.async {
                self.display(hero: hero)
            }
        }
    }
    
    @IBAction func randomizeTapped(_ sender: UIButton) { showRandomHero()
    }
}


