//
//  ViewController.swift
//  Custom Control
//
//  Created by Julian A. Fordyce on 1/15/19.
//  Copyright © 2019 Glas Labs. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    @IBAction func updateRating(_ sender: CustomControl) {
        let N = sender.value
        
        if N < 2 {
            self.title = "User Rating: \(N) star"
        } else {
            self.title = "User Rating: \(N) stars"
        }
    }
    
    
    
}

