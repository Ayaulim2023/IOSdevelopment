//
//  ViewController.swift
//  DiceeApp
//
//  Created by Аяулым Куат on 21.10.2025.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
            super.viewDidLoad()
            // Set initial dice images
            leftDiceImageView.image = UIImage(named: "dice1")
            rightDiceImageView.image = UIImage(named: "dice1")

            // Optional: make images look nicer
            leftDiceImageView.contentMode = .scaleAspectFit
            rightDiceImageView.contentMode = .scaleAspectFit
        }
    
    
    @IBOutlet weak var leftDiceImageView: UIImageView!
    
    @IBOutlet weak var rightDiceImageView: UIImageView!
    
    @IBAction func rollButtonTapped(_ sender: UIButton) {
        rollDice()
    }
    
    func rollDice() {
            let leftNumber = Int.random(in: 1...6)
            let rightNumber = Int.random(in: 1...6)

            leftDiceImageView.image = UIImage(named: "dice\(leftNumber)")
            rightDiceImageView.image = UIImage(named: "dice\(rightNumber)")

            UIView.animate(withDuration: 0.12,
                           animations: { [weak self] in
                            self?.leftDiceImageView.transform = CGAffineTransform(scaleX: 1.08, y: 1.08)
                            self?.rightDiceImageView.transform = CGAffineTransform(scaleX: 1.08, y: 1.08)
                           }) { [weak self] _ in
                UIView.animate(withDuration: 0.12) {
                    self?.leftDiceImageView.transform = .identity
                    self?.rightDiceImageView.transform = .identity
                }
            }
        }

        override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
            guard motion == .motionShake else { return }
            rollDice()
        }

        override var canBecomeFirstResponder: Bool {
            return true
        }

        override func viewDidAppear(_ animated: Bool) {
            super.viewDidAppear(animated)
            becomeFirstResponder()
        }

        override func viewWillDisappear(_ animated: Bool) {
            super.viewWillDisappear(animated)
            resignFirstResponder()
        }
}

