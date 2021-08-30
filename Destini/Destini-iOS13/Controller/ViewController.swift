//
//  ViewController.swift
//  Destini-iOS13
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var storyLabel: UILabel!
    @IBOutlet weak var choice1Button: UIButton!
    @IBOutlet weak var choice2Button: UIButton!
    
    var storyBrain = StoryBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    
    @IBAction func choiceMade(_ sender: UIButton) {
        //        To move functionality into the nextStory
        var userChoice = ""
        if sender.titleLabel!.text == storyBrain.getChoice1() {
            userChoice = storyBrain.getChoice1()
        } else {
            userChoice = storyBrain.getChoice2()
        }

        storyBrain.nextStory(userChoice: userChoice)

        updateUI()
    }
    
    func updateUI() {
        storyLabel.text = storyBrain.getStoryText()
        
        choice1Button.setTitle(storyBrain.getChoice1(), for: .normal)
        
        choice2Button.setTitle(storyBrain.getChoice2(), for: .normal)
    }
    
}

