//
//  ViewController.swift
//  StoryPrompt
//
//  Created by Pedro Gonzalez Ferrandez on 08.03.23.
//

import UIKit
import PhotosUI

class AddStoryPromptViewController: UIViewController {
    
    @IBOutlet weak var noun: UITextField!
    @IBOutlet weak var adjectiveTextField: UITextField!
    @IBOutlet weak var verbTextField: UITextField!
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var numberSliderField: UISlider!
    @IBOutlet weak var storyPromptImageView: UIImageView!
    
    let storyPrompt = StoryPromptEntry()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        numberSliderField.value = 7.5
        storyPrompt.noun = "noun"
        storyPrompt.adjective = "adjective"
        storyPrompt.verb = "verb"
        storyPrompt.number = Int(numberSliderField.value)
        storyPromptImageView.isUserInteractionEnabled = true
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(changeImage))
        storyPromptImageView.addGestureRecognizer(gestureRecognizer)
        
        print(storyPrompt)
    }
    
    @objc func changeImage() {
        var configuration = PHPickerConfiguration()
        configuration.filter = .images
        configuration.selectionLimit = 1
        let controller = PHPickerViewController(configuration: configuration)
        controller.delegate = self
        present(controller, animated: true)
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
        
        if storyPrompt.isValid() {
            print(storyPrompt)
        } else {
            showInvalidStoryPromptAlert()
        }
    }
    
    func updateStoryPrompt() {
        storyPrompt.noun = noun.text ?? ""
        storyPrompt.adjective = adjectiveTextField.text ?? ""
        storyPrompt.verb = verbTextField.text ?? ""
    }
    
    func showInvalidStoryPromptAlert() {
        let alert = UIAlertController(title: "Invalid Story Prompt", message: "Please fill out all of the fields", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default) { action in
            
        }
        alert.addAction(action)
        present(alert, animated: true)
    }
}

extension AddStoryPromptViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        updateStoryPrompt()
        return true
    }
}

extension AddStoryPromptViewController: PHPickerViewControllerDelegate {
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        if !results.isEmpty {
            let result = results.first!
            let itemProvider = result.itemProvider
            if itemProvider.canLoadObject(ofClass: UIImage.self) {
                itemProvider.loadObject(ofClass: UIImage.self) {
                    [weak self] image, error in
                    guard let image = image as? UIImage else {
                        return
                    }
                    DispatchQueue.main.async {
                        self?.storyPromptImageView.image = image
                        self?.dismiss(animated: true, completion: nil)
                    }
                }
            }
        }
    }
    
    
}

