//
//  ViewController.swift
//  RandomizerApp
//
//  Created by Аяулым Куат on 20.10.2025.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var itemImageView: UIImageView!
       @IBOutlet weak var itemLabel: UILabel!
       
    @IBOutlet weak var randomizeButtonTapped: UIButton!
    let items: [(name: String, image: String)] = [
           ("Rose", "flower1"),
           ("Tulip", "flower2"),
           ("Lily", "flower3"),
           ("Sunflower", "flower4"),
           ("Daisy", "flower5"),
           ("Orchid", "flower6"),
           ("Peony", "flower7"),
           ("Lavender", "flower8"),
           ("Cherry Blossom", "flower9"),
           ("Hydrangea", "flower10")
       ]
       
       override func viewDidLoad() {
           super.viewDidLoad()
           showRandomItem()
       }
       
       func showRandomItem() {
           let randomItem = items.randomElement()!
           itemLabel.text = randomItem.name
           itemImageView.image = UIImage(named: randomItem.image)
       }

       @IBAction func randomizeButtonTapped(_ sender: UIButton) {
           showRandomItem()
       }


}

