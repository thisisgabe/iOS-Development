//
//  SliderViewController.swift
//  Showcase
//
//  Created by Gabriel Velasquez on 4/3/16.
//  Copyright © 2016 CSUSM. All rights reserved.
//

import UIKit

class SliderViewController: UIViewController, UITextFieldDelegate {

    var redColor:CGFloat = 1.0
    var greenColor:CGFloat = 1.0
    var blueColor:CGFloat = 1.0
    
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    @IBOutlet weak var redValue: UITextField!
    @IBOutlet weak var greenValue: UITextField!
    @IBOutlet weak var blueValue: UITextField!
    
    @IBAction func redSlider(sender: UISlider) {
        redColor = CGFloat(redSlider.value)
        redValue.text = String(format: "%.0f",Float(redColor*255.0))
        updateColor()
    }
    
    @IBAction func greenSlider(sender: UISlider) {
        greenColor = CGFloat(greenSlider.value)
        greenValue.text = String(format: "%.0f",Float(greenColor*255.0))
        updateColor()
    }
    
    @IBAction func blueSlider(sender: UISlider) {
        blueColor = CGFloat(blueSlider.value)
        blueValue.text = String(format: "%.0f",Float(blueColor*255.0))
        updateColor()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.redValue.delegate = self
        self.greenValue.delegate = self
        self.blueValue.delegate = self
        
        updateColor()
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func updateColor() {
        self.view.backgroundColor = UIColor(red: redColor, green: greenColor, blue: blueColor, alpha: 1.0)
    }

}

