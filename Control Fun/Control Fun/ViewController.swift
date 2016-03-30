//
//  ViewController.swift
//  Control Fun
//
//  Created by Gabriel Velasquez on 3/16/16.
//  Copyright © 2016 CSUSM. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var numberField: UITextField!
    @IBOutlet weak var sliderLabel: UILabel!

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sliderLabel.text = "50"
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func textFieldDoneEditing(sender: UITextField) {
        sender.resignFirstResponder()
    }
    
    @IBAction func backgroundTap(sender: UIControl){
            nameField.resignFirstResponder()
            numberField.resignFirstResponder()
    }
    
    @IBAction func sliderChanged(sender: UISlider) {
            let progress = lroundf(sender.value)
            sliderLabel.text = "\(progress)"
    }

}

