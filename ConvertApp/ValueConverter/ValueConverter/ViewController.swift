//
//  ViewController.swift
//  ValueConverter
//
//  Created by Gabriel Velasquez on 3/15/16.
//  Copyright © 2016 CSUSM. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var txtMainValue: UITextField!
    @IBOutlet weak var lblUnits: UILabel!
    @IBOutlet weak var lblSecValue: UILabel!
    @IBOutlet weak var lblSlider: UILabel!
    @IBOutlet weak var lblFinalValue: UILabel!
    @IBOutlet weak var switchUnits: UISwitch!

    @IBOutlet weak var sliderUnits: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let values = lroundf(sliderUnits.value)
        lblSlider.text = "\(values)"
        
        
    }

    @IBAction func toggleUnit(sender: UISwitch) {
        let mode = switchUnits.on
        if(mode)
        {
            lblUnits.text = "Pounds"
            lblSecValue.text = "Ounces"
            sliderUnits.minimumValue = 0
            sliderUnits.maximumValue = 16
        }
        else
        {
            lblUnits.text = "Feet"
            lblSecValue.text = "Inches"
            sliderUnits.minimumValue = 0
            sliderUnits.maximumValue = 12
            
        }
    }
    
    @IBAction func calcButton(sender: AnyObject) {
        
        let mode = switchUnits.on

        if(mode)
        {
            var convertedValue: Float
            let mainValue = Float(txtMainValue.text!)! / 0.0022046
            let secondValue = Float(sliderUnits.value) / 0.035274
            convertedValue = mainValue + secondValue
            lblFinalValue.text = "\(convertedValue)" + " gms"
        }
        else
        {
            var convertedValue: Float
            let mainValue = Float(txtMainValue.text!)! * 30.48
            let secondValue = Float(sliderUnits.value) * 2.54
            convertedValue = mainValue + secondValue
            lblFinalValue.text = "\(convertedValue)" + " cms"
            
        }
        
    }

    @IBAction func sliderChanged(sender: AnyObject) {
        let values = lroundf(sliderUnits.value)
        lblSlider.text = "\(values)"
    }
    
    @IBAction func backgroundTap(sender: UIControl) {
        txtMainValue.resignFirstResponder()
    }
}

