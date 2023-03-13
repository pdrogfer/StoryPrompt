//
//  StoryPromptTableViewController.swift
//  StoryPrompt
//
//  Created by Pedro Gonzalez Ferrandez on 13.03.23.
//

import UIKit

class StoryPromptTableViewController: UITableViewController {

    var storyPrompts = [StoryPromptEntry]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // addDemoPrompts()
    }
    
    func addDemoPrompts() {
        
        let sp1 = StoryPromptEntry()
        sp1.noun = "toaster"
        sp1.adjective = "smelly"
        sp1.verb = "attacks"
        sp1.number = 5
        
        let sp2 = StoryPromptEntry()
        sp2.noun = "toaster"
        sp2.adjective = "smelly"
        sp2.verb = "attacks"
        sp2.number = 5
        
        let sp3 = StoryPromptEntry()
        sp3.noun = "toaster"
        sp3.adjective = "smelly"
        sp3.verb = "attacks"
        sp3.number = 5
        
        storyPrompts = [sp1, sp2, sp3]
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return storyPrompts.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "StoryPromptCell", for: indexPath)
        cell.textLabel?.text = "Prompt \(indexPath.row + 1)"
        cell.imageView?.image = storyPrompts[indexPath.row].image
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyPrompt = storyPrompts[indexPath.row]
        performSegue(withIdentifier: "ShowStoryPrompt", sender: storyPrompt)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowStoryPrompt" {
            guard let storyPromptViewController = segue.destination as? StoryPromptViewController,
                  let storyPrompt = sender as? StoryPromptEntry else {
                return
            }
            storyPromptViewController.storyPrompt = storyPrompt
        }
    }
    
    @IBAction func saveStoryPrompt(unwindSegue: UIStoryboardSegue) {
        guard let storyPromptViewController = unwindSegue.source as? StoryPromptViewController,
              let storyPrompt = storyPromptViewController.storyPrompt else {
            return
        }
        
        storyPrompts.append(storyPrompt)
        tableView.reloadData()
    }
    
    @IBAction func cancelStoryPrompt(unwindSegue: UIStoryboardSegue) {
        
    }
}
