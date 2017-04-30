//
//  DetailEntryViewController.swift
//  Journal2017
//
//  Created by Patrick Pahl on 4/29/17.
//  Copyright © 2017 Patrick Pahl. All rights reserved.
//

import UIKit

class DetailEntryViewController: UIViewController {
    
    var entry: Entry?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateFieldsWith()
    }
    
    @IBOutlet var entryTextView: UITextView!
    
    @IBAction func saveButtonTapped(_ sender: UIBarButtonItem) {
        
        if let text = entryTextView.text {
            if entry == nil && text != "Your note here..." {
                EntryController.sharedController.createEntry(text: text)
            } else if text != "Your note here..." {
                if let entry = entry {
                    EntryController.sharedController.updateEntry(entry: entry, text: text)
                }
            }
            let _ = navigationController?.popToRootViewController(animated: true)
        }
    }
    
    func updateFieldsWith() {
        if entry != nil {
            entryTextView.text = entry?.text
        }
    }
}
