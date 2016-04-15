//
//  UnitConverterController.swift
//  TabBarApp
//
//  Created by Gabriel Velasquez on 4/5/16.
//  Copyright © 2016 CSUSM. All rights reserved.
//

import UIKit

class UnitConverterController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    private let mainComponent = 0
    private let secondComponent = 1
    private var secondUnits:[String]!
    
    private let mainUnits = [ "Pounds", "Feet", "Mph"]
    private let poundConv = [ "Stone", "Kg", "G"]
    private let feetConv = ["M", "Km", "Cm"]
    private let mphConv = [ "M/s", "Km/hr"]
    
    @IBOutlet weak var textFirst: UITextField!
    @IBOutlet weak var textSecond: UITextField!
    @IBOutlet weak var labelFirst: UILabel!
    @IBOutlet weak var labelSecond: UILabel!
    @IBOutlet weak var pickerUnits: UIPickerView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        secondUnits = poundConv
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func buttonPressed(sender: UIButton) {
        let wheelone = pickerUnits.selectedRowInComponent(0)
        let wheeltwo = pickerUnits.selectedRowInComponent(1)
        
        //we are using pounds
        if(wheelone == 0)
        {
            //convert to stone
            if(wheeltwo == 0)
            {
                let conv = Double(textFirst.text!)
                let finalans = conv! * 0.0714286
                textSecond.text = "\(finalans)"
            }
            
            //convert to Kg
            if(wheeltwo == 1)
            {
                let conv = Double(textFirst.text!)
                let finalans = conv! * 0.453592
                textSecond.text = "\(finalans)"
            }
            
            //convert to g
            if(wheeltwo == 2)
            {
                let conv = Double(textFirst.text!)
                let finalans = conv! * 453.592
                textSecond.text = "\(finalans)"
            }
        }
        
        //we are using feet
        if(wheelone == 1)
        {
            //convert to meters
            if(wheeltwo == 0)
            {
                let conv = Double(textFirst.text!)
                let finalans = conv! * 0.3048
                textSecond.text = "\(finalans)"
            }
            
            //convert to km
            if(wheeltwo == 1)
            {
                let conv = Double(textFirst.text!)
                let finalans = conv! * 0.0003048
                textSecond.text = "\(finalans)"
            }
            
            //convert to cm
            if(wheeltwo == 2)
            {
                let conv = Double(textFirst.text!)
                let finalans = conv! * 30.48
                textSecond.text = "\(finalans)"
            }
        }
        
        
        //we are using mph
        if(wheelone == 2)
        {
            //convert to m/s
            if(wheeltwo == 0)
            {
                let conv = Double(textFirst.text!)
                let finalans = conv! * 0.44704
                textSecond.text = "\(finalans)"
            }
            
            //convert to km/hr
            if(wheeltwo == 1)
            {
                let conv = Double(textFirst.text!)
                let finalans = conv! * 1.60934
                textSecond.text = "\(finalans)"
            }
            
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int
    {
        return 2
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int
    {
        if (component == mainComponent)
        {
            return mainUnits.count
        }
        else
        {
            return secondUnits.count
        }
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        if(component == mainComponent)
        {
            if(row == 0)
            {
                secondUnits = poundConv
                labelFirst.text = "Pounds"
                labelSecond.text = "Stone"
            }
            else if row == 1
            {
                secondUnits = feetConv
                labelFirst.text = "Feet"
                labelSecond.text = "M"
            }
            else{
                secondUnits = mphConv
                labelFirst.text = "Mph"
                labelSecond.text = "M/s"
            }
            pickerUnits.reloadComponent(secondComponent)
            pickerUnits.selectRow(0, inComponent: secondComponent,
                                      animated: true)

            
        }
        
        if(component==secondComponent)
        {
            //the first wheel is set to pounds
            if(pickerView.selectedRowInComponent(0) == 0)
            {
                if(row == 0)
                {
                    labelSecond.text = poundConv[0]
                }
                
                if(row == 1)
                {
                    labelSecond.text = poundConv[1]
                }
                
                if(row == 2)
                {
                    labelSecond.text = poundConv[2]
                }
                
            }
            
            //the second whell is set to feet
            if(pickerView.selectedRowInComponent(0) == 1)
            {
                if(row == 0)
                {
                    labelSecond.text = feetConv[0]
                }
                
                if(row == 1)
                {
                    labelSecond.text = feetConv[1]
                }
                
                if(row == 2)
                {labelSecond.text = feetConv[2]
                    
                }
                
            }
            
            //the third wheel is set to mph
            if(pickerView.selectedRowInComponent(0) == 2)
            {
                if(row == 0)
                {
                    labelSecond.text = mphConv[0]
                }
                
                if(row == 1)
                {
                    labelSecond.text = mphConv[1]
                }
                
                
            }
        }
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?
    {
        if component == mainComponent
        {
            return mainUnits[row]
        }
        else
        {
            return secondUnits[row]
        }
    }
    

}
