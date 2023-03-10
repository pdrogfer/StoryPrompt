//
//  StoryPromptViewController.swift
//  StoryPrompt
//
//  Created by Pedro Gonzalez Ferrandez on 10.03.23.
//

import UIKit

class StoryPromptViewController: UIViewController {

    @IBOutlet weak var storyPromptTextView: UITextView!
    
    let storyPrompt = StoryPromptEntry()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        storyPrompt.noun = "toaster"
        storyPrompt.adjective = "smelly"
        storyPrompt.verb = "swims"
        storyPrompt.number = 7
        
        storyPromptTextView.text = storyPrompt.description
    }
}
