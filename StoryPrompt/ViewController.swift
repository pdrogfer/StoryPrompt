//
//  ViewController.swift
//  StoryPrompt
//
//  Created by Pedro Gonzalez Ferrandez on 08.03.23.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let storyPrompt = StoryPromptEntry()
        storyPrompt.noun = "noun"
        storyPrompt.adjective = "adjective"
        storyPrompt.verb = "verb"
        storyPrompt.number = 10
        print(storyPrompt)
    }


}

