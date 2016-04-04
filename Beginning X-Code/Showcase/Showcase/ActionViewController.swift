//
//  ActionViewController.swift
//  Showcase
//
//  Created by Gabriel Velasquez on 4/3/16.
//  Copyright © 2016 CSUSM. All rights reserved.
//

import UIKit

class ActionViewController: UIViewController {

    @IBOutlet weak var actionControl: UISegmentedControl!
    
    @IBOutlet weak var showmeButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        showmeButton.backgroundColor = UIColor(red: 9/255.0, green: 95/255.0, blue: 134/255.0, alpha: 1.0)
        showmeButton.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        showmeButton.layer.cornerRadius = 4.0

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func performAction(sender: UIButton) {
        if actionControl.selectedSegmentIndex == 0
        {
            let controller : UIAlertController = UIAlertController(title: "This is an alert",
                                                                   message: "You've created an alert view",
                                                                   preferredStyle: UIAlertControllerStyle.Alert)
            let okAction : UIAlertAction = UIAlertAction(title: "Okay",
                                                         style: UIAlertActionStyle.Default,
                                                         handler: {
                                                            (alert: UIAlertAction!) in controller.dismissViewControllerAnimated(true, completion: nil) })
            controller.addAction(okAction);
            self.presentViewController(controller, animated: true, completion: nil)
        }
        else
        {
            let controller : UIAlertController = UIAlertController(title: "This is an action sheet",
                message: "You've created an action sheet", preferredStyle: UIAlertControllerStyle.ActionSheet)
            
            let okAction : UIAlertAction = UIAlertAction(title: "Okay", style: UIAlertActionStyle.Default,
                                                         handler: { (alert: UIAlertAction!) in controller.dismissViewControllerAnimated(true, completion: nil)
            })
            controller.addAction(okAction);
            self.presentViewController(controller, animated: true, completion: nil)    }
        }
    }



