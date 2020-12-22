//
//  ViewController.swift
//  Approximation-de-Pi
//
//  Created by Anthony Peres da Cruz on 21/12/2020.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

 
    @IBAction func slider(_ sender: UISlider) {
        label.text = String(sender.value)

    }
    
}

