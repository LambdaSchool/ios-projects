//
//  ViewController.swift
//  UIControl
//
//  Created by Sergey Osipyan on 1/8/19.
//  Copyright © 2019 Sergey Osipyan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow
       
    }

    @IBAction func updateRating(_ ratingControl: CustomControl) {
        
        if CustomControl.value < 2 {
            self.navigationItem.title = "User Rating: \(CustomControl.value) star"
        } else {
        
        self.navigationItem.title = "User Rating: \(CustomControl.value) stars"
      
        }

    
}

}
