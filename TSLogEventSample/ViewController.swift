//
//  ViewController.swift
//  TSLogEventSample
//
//  Created by Layton, James on 7/22/21.
//  Copyright © 2021 Title Source. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet private weak var eventLogButton: UIButton!
    @IBOutlet private weak var eventLogButton2: UIButton!
    @IBOutlet private weak var eventLogTextView: UITextView!
    
    @IBAction func eventLogButtonTapped(_ sender: UIButton) {
    
        if sender.tag == 0 {
            TSLogEvent.logEvent("User tapped Button 1")
        } else {
            TSLogEvent.logEvent("User tapped Button 2")
        }
    
        eventLogTextView.text = TSLogEvent.logHistory()
    }
}
