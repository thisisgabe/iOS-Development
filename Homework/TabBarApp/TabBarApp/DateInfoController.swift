//
//  DateInfoController.swift
//  TabBarApp
//
//  Created by Gabriel Velasquez on 4/5/16.
//  Copyright © 2016 CSUSM. All rights reserved.
//

import UIKit

class DateInfoController: UIViewController {

    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var labelAge: UILabel!
    @IBOutlet weak var labelDayofweek: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func buttonPressed(sender: UIButton) {
        
        let birthday = datePicker.date
        let calendar = NSCalendar.currentCalendar()
        let now = NSDate()
        let ageComponents = calendar.components(.Year,
                                                fromDate: birthday,
                                                toDate: now,
                                                options: [])
        let age = ageComponents.year
        
        labelAge.text = "You are \(age) years old. Hooray!"
        
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "EEEE"
        let dayOfWeekString = dateFormatter.stringFromDate(birthday)
        labelDayofweek.text = "You were born on a \(dayOfWeekString). Tubular!"
    
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
