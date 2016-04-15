//
//  BookInfoController.swift
//  TabBarApp
//
//  Created by Gabriel Velasquez on 4/5/16.
//  Copyright © 2016 CSUSM. All rights reserved.
//

import UIKit

class BookInfoController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    private let bookComponent = 0
    private var bookInfo:[String : [String]]!
    private var books:[String]!
    private var bookdetails:[String]!

    @IBOutlet weak var bookPicker: UIPickerView!
    @IBOutlet weak var imageBook: UIImageView!
    @IBOutlet weak var textBook: UITextView!
    @IBOutlet weak var labelBook: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //load the picker with the book information
        let bundle = NSBundle.mainBundle()
        let plistURL = bundle.URLForResource("books",
                                             withExtension: "plist")
        bookInfo = NSDictionary(contentsOfURL: plistURL!)
            as! [String : [String]]
        let allBooks = bookInfo.keys
        books = allBooks.sort()
        let selectedBook = books[0]
        bookdetails = bookInfo[selectedBook]
        labelBook.text = books[0]
        imageBook.image = UIImage(named: bookdetails[0])
        textBook.text = bookdetails[1]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int
    {
        return books.count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?
    {
        return books[row]
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        let itemSelected = books[row]
        bookdetails = bookInfo[itemSelected]
        labelBook.text = books[row]
        imageBook.image = UIImage(named: bookdetails[0])
        textBook.text = bookdetails[1]
    }
    
    

}
