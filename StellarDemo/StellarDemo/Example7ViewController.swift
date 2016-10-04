//
//  Example7ViewController.swift
//  StellarDemo
//
//  Created by AugustRush on 6/8/16.
//  Copyright © 2016 August. All rights reserved.
//

import UIKit

class Example7ViewController: UIViewController {

    @IBOutlet weak var button: UIButton!
    
    @IBAction func loadFromJSON(_ sender: AnyObject) {
        do {
            try button.configureWithJSON("{\"moveX\": \"100\", \"duration\": \"1\"}")
            button.animate()
        } catch {
            print(error)
        }
    }
}
