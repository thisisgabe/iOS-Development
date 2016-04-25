//
//  RootViewController.swift
//  Fonts
//
//  Created by Gabriel Velasquez on 4/19/16.
//  Copyright © 2016 CSUSM. All rights reserved.
//

import UIKit

class RootViewController: UITableViewController {
    
    //private variables used by the app all the time
    private var familyNames: [String]!
    private var cellPointSize: CGFloat!
    
    //will poing to favorites list singleton we created
    private var favoritesList: FavoritesList!
    
    //constants for cell identifiers
    private static let familyCell = "FamilyName"
    private static let favoritesCell = "Favorites"

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //get all system fonts
        familyNames = (UIFont.familyNames() as [String]).sort()
        
        //get from settings prefered headline font
        let preferredTableViewFont = UIFont.preferredFontForTextStyle(UIFontTextStyleHeadline)
        
        //set default size var to user pref
        cellPointSize = preferredTableViewFont.pointSize
        
        //get favorites list from settings
        favoritesList = FavoritesList.sharedFavoritesList
        
        //set this view to estimate view height by default value
        tableView.estimatedRowHeight = cellPointSize
    }
    
    //we use this to show the fav view if we have any, if not don't
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    //to figure out which font to display in the cell
    func fontForDisplay(atIndexPath indexPath: NSIndexPath) -> UIFont? {
        if indexPath.section == 0 {
            let familyName = familyNames[indexPath.row]
            let fontName = UIFont.fontNamesForFamilyName(familyName).first
            return fontName != nil ?
                UIFont(name: fontName!, size: cellPointSize) : nil
        } else {
            return nil
        }
    }
    
    //if we got favorites we will have 2 sections, otherwise we will have 1
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // Return the number of sections.
        return favoritesList.favorites.isEmpty ? 1 : 2
    }
    
    //if the section is the first 1, return the # of names, otherwise return 1 since the fav
    //list will be a tablecell the user can click to get to a new view
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Return the number of rows in the section.
        return section == 0 ? familyNames.count : 1
    }
    
    //return the section header name
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return section == 0 ? "All Font Families" : "My Favorite Fonts"
    }
    
    //configure each cell
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            // The font names list
            let cell = tableView.dequeueReusableCellWithIdentifier(
                RootViewController.familyCell,
                forIndexPath: indexPath)
            cell.textLabel?.font = fontForDisplay(atIndexPath: indexPath)
            cell.textLabel?.text = familyNames[indexPath.row]
            cell.detailTextLabel?.text = familyNames[indexPath.row]
            return cell
        } else {
            // The favorites list
            return tableView.dequeueReusableCellWithIdentifier(
                RootViewController.favoritesCell,
                forIndexPath: indexPath)
        }
    }
    
    // MARK: Navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
        let indexPath = tableView.indexPathForCell(sender as! UITableViewCell)!
        let listVC = segue.destinationViewController as! FontListViewController
        if indexPath.section == 0 {
            // Font names list
            let familyName = familyNames[indexPath.row]
            listVC.fontNames = (UIFont.fontNamesForFamilyName(familyName) as [String]).sort()
            listVC.navigationItem.title = familyName
            listVC.showsFavorites = false
        } else {
            // Favorites list
            listVC.fontNames = favoritesList.favorites
            listVC.navigationItem.title = "Favorites"
            listVC.showsFavorites = true
        }
    }



}
