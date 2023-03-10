//
//  ViewController.swift
//  StoryPrompt
//
//  Created by Pedro Gonzalez Ferrandez on 08.03.23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var noun: UITextField!
    @IBOutlet weak var adjectiveTextField: UITextField!
    @IBOutlet weak var verbTextField: UITextField!
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var numberSliderField: UISlider!
    
    let storyPrompt = StoryPromptEntry()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        numberSliderField.value = 7.5
        storyPrompt.noun = "noun"
        storyPrompt.adjective = "adjective"
        storyPrompt.verb = "verb"
        storyPrompt.number = Int(numberSliderField.value)
        print(storyPrompt)
    }
    
    @IBAction func changeNumber(_ sender: UISlider) {
        let newIntValue = Int(sender.value)
        numberLabel.text = "Number: \(newIntValue)"
        
        storyPrompt.number = newIntValue
        
        print(storyPrompt)
    }
    
    @IBAction func changeStoryType(_ sender: UISegmentedControl) {
        if let genre = StoryPrompts.Genre(rawValue: sender.selectedSegmentIndex) {
            storyPrompt.genre = genre
        } else {
            storyPrompt.genre = .scifi
        }
    }
    
    @IBAction func generateStoryPrompt(_ sender: Any) {
        updateStoryPrompt()
        print(storyPrompt)
    }
    
    func updateStoryPrompt() {
        storyPrompt.noun = noun.text ?? ""
        storyPrompt.adjective = adjectiveTextField.text ?? ""
        storyPrompt.verb = verbTextField.text ?? ""
    }
}

extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        updateStoryPrompt()
        return true
    }
}

