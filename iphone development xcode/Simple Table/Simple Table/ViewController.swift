//
//  ViewController.swift
//  Simple Table
//
//  Created by Gabriel Velasquez on 4/17/16.
//  Copyright © 2016 CSUSM. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    private let dwarves = [
        "Sleepy", "Sneezy", "Bashful", "Happy",
        "Doc", "Grumpy", "Dopey",
        "Thorin", "Dorin", "Nori", "Ori",
        "Balin", "Dwalin", "Fili", "Kili",
        "Oin", "Gloin", "Bifur", "Bofur",
        "Bombur"
    ]
    
    let simpleTableIdentifier = "SimpleTableIdentifier"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dwarves.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier(simpleTableIdentifier)
        if (cell == nil) {
            //create new cell to insert into tableview
            cell = UITableViewCell(
                style: UITableViewCellStyle.Default,
                reuseIdentifier: simpleTableIdentifier)
        }
        
        //each tablecell will have an image on the left
        //one default, one highlighted, add it to cell
        let image = UIImage(named: "star")
        cell?.imageView?.image = image
        let highlightedImage = UIImage(named: "star2")
        cell?.imageView?.highlightedImage = highlightedImage
        
        if indexPath.row < 7 {
            cell?.detailTextLabel?.text = "Mr Disney"
        } else {
            cell?.detailTextLabel?.text = "Mr Tolkien"
        }
        
        //sets the label of the cell to the name of the dwarve for that row, correct order
        cell?.textLabel?.text = dwarves[indexPath.row]
        return cell!
    }
    
    
    //indents the rows basedevery 4 rows
    func tableView(tableView: UITableView, indentationLevelForRowAtIndexPath indexPath: NSIndexPath) -> Int {
        return indexPath.row % 4
    }
    
    //makes first row unselectable, called before the row is selected
    func tableView(tableView: UITableView, willSelectRowAtIndexPath indexPath: NSIndexPath) -> NSIndexPath? {
            return indexPath.row == 0 ? nil : indexPath
    }
    
    
    //what happens when a row is selected
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let rowValue = dwarves[indexPath.row]
        let message = "You selected \(rowValue)"
        let controller = UIAlertController(title: "Row Selected",
                                           message: message, preferredStyle: .Alert)
        let action = UIAlertAction(title: "Yes I Did",
                                   style: .Default, handler: nil)
        controller.addAction(action)
        presentViewController(controller, animated: true, completion: nil)
    }
    
    


}

