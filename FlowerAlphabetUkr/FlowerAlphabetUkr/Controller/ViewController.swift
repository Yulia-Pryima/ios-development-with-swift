//
//  ViewController.swift
//  FlowerAlphabetUkr
//
//  Created by Yulia Pryima on 2021/09/17.
//
//  This is a kids game to learn Ukrainian Alphabet with flowers

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var buttonAa: UIButton!
    @IBOutlet weak var buttonBe: UIButton!
    @IBOutlet weak var buttonWe: UIButton!
    @IBOutlet weak var buttonGe: UIButton!
    @IBOutlet weak var buttonGge: UIButton!
    @IBOutlet weak var buttonDe: UIButton!
    
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var playNextButton: UIButton!
    
    @IBOutlet weak var largeFlower: UIImageView!
    
    var player: AVAudioPlayer!
    
    var letterInEng = "Aa"
    var flowerName = "akatsiya"
    var playButtonflowerName = "akatsiya"
    var ukrLetter = "Аа"
    
    var alphabetBrain = AlphabetBrain()
    var currentFlowersSet = ["akatsiya", "barvinok", "voloshky", "horitsvit", "gglid", "derevii"]
    var cards: [UIButton] = [UIButton]()
    var count = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        currentFlowersSet = []
        for i in count...(count + 5) {
            currentFlowersSet.append(alphabetBrain.flowerNames[i].flower)
        }
        count = count + 6
        setCards()
    }
    
    @IBAction func letterButtonPressed(_ sender: UIButton) {
        for i in 0...32 {
        if sender.currentBackgroundImage! == UIImage(named: alphabetBrain.flowerNames[i].flower) {
            flowerName = alphabetBrain.flowerNames[i].flower
            }
        }
        playSound(soundName: flowerName)
        checkAnswer()
    }
    
    @IBAction func playButtonPressed(_ sender: UIButton) {
        // Play random sound from current cards
        playButtonflowerName = currentFlowersSet.randomElement()!
        playSound(soundName: playButtonflowerName)
        
        for card in cards {
            card.isEnabled = true
        }
    }
    
    // To set images and letters for next card set
    @IBAction func playNextButtonPressed(_ sender: UIButton) {
        
        for card in cards {
            card.isHidden = false
        }
        
        largeFlower.isHidden = true
        playNextButton.isHidden = true
        playNextButton.isEnabled = false
        playButton.isHidden = false
        playButton.isEnabled = true
        
        currentFlowersSet = []
        for i in count...(count + 5) {
            currentFlowersSet.append(alphabetBrain.flowerNames[i].flower)
            if i == 32 {
                setLastCardsSet()
                return
            }

        }
        count = count + 6
        var tempCount = count - 6
        
        for card in cards {
            card.setTitle(alphabetBrain.flowerNames[tempCount].ukrLetter, for: UIControl.State.normal)
            card.setBackgroundImage(UIImage(named: alphabetBrain.flowerNames[tempCount].flower), for : UIControl.State.normal)
            tempCount += 1
        }
    }
    
    func playSound(soundName: String) {
        let url = Bundle.main.url(forResource: soundName, withExtension: "m4a")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
    }
    
    func setCards() {
        cards = [buttonAa, buttonBe, buttonWe, buttonGe, buttonGge, buttonDe]

        for card in cards {
            card.layer.borderWidth = 3
            card.layer.borderColor = UIColor.darkGray.cgColor
            card.isEnabled = false
        }
        
        var tempCount = count - 6
        
        for card in cards {
            card.setTitle(alphabetBrain.flowerNames[tempCount].ukrLetter, for: UIControl.State.normal)
            card.setBackgroundImage(UIImage(named: alphabetBrain.flowerNames[tempCount].flower), for : UIControl.State.normal)
            tempCount += 1
        }
    }
    
    func checkAnswer() {
        if playButtonflowerName == flowerName {
            for card in cards {
                card.isEnabled = false
            }
            
            playButton.isEnabled = false
            playNextButton.isEnabled = true
            playNextButton.isHidden = false

            largeFlower.image = UIImage(named: flowerName)
            largeFlower.isHidden = false
            
        } else {
        print("Incorrect")
        }
    }
    
    func setLastCardsSet() {
        for card in cards {
            card.isEnabled = false
        }
        
        buttonAa.setTitle(alphabetBrain.flowerNames[count].ukrLetter, for: UIControl.State.normal)
        buttonBe.setTitle(alphabetBrain.flowerNames[count + 1].ukrLetter, for: UIControl.State.normal)
        buttonWe.setTitle(alphabetBrain.flowerNames[count + 2].ukrLetter, for: UIControl.State.normal)
        
        buttonAa.setBackgroundImage(UIImage(named: alphabetBrain.flowerNames[count].flower), for : UIControl.State.normal)
        buttonBe.setBackgroundImage(UIImage(named: alphabetBrain.flowerNames[count + 1].flower), for : UIControl.State.normal)
        buttonWe.setBackgroundImage(UIImage(named: alphabetBrain.flowerNames[count + 2].flower), for : UIControl.State.normal)
        
        count = 0
        
        buttonGe.isHidden = true
        buttonGge.isHidden = true
        buttonDe.isHidden = true
        
        buttonGe.isEnabled = false
        buttonGge.isEnabled = false
        buttonDe.isEnabled = false
    }

}

