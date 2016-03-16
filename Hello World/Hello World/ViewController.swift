//
//  ViewController.swift
//  Hello World
//
//  Created by Gabriel Velasquez on 3/15/16.
//  Copyright © 2016 CSUSM. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var lblStatus: UILabel!
    
    
    @IBAction func buttonPressed(sender: UIButton) {
        let title = sender.titleForState(.Normal)!
        let plainText = "\(title) button pressed"
        let styledText = NSMutableAttributedString(string: plainText)
        let attributes = [
            NSFontAttributeName:
            UIFont.boldSystemFontOfSize(lblStatus.font.pointSize)
        ]
        let nameRange = (plainText as NSString).rangeOfString(title)
        styledText.setAttributes(attributes, range: nameRange)
        lblStatus.attributedText = styledText
        
        
    }



}

