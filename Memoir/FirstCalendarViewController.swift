//
//  FirstCalendarViewController.swift
//  Memoir
//
//  Created by Monith Ilavarasan on 11/20/16.
//  Copyright © 2016 Sophia KC. All rights reserved.
//

import UIKit

class FirstCalendarViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    var viewEntries: [[String:Any]] = []
    
    
    @IBOutlet weak var dateTitleView: UIView!
    
    @IBOutlet weak var currentDateTitleLable: UILabel!
    
    @IBOutlet weak var tableView: UITableView!
    
    let cellReuseIdentifier = "cell"
    let cellSpacingHeight: CGFloat = 0
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(self.respondToSwipeGesture))
        swipeRight.direction = UISwipeGestureRecognizerDirection.right
        self.view.addGestureRecognizer(swipeRight)
        
        let swipeLeft = UISwipeGestureRecognizer(target:self, action:#selector(self.respondToSwipeGesture))
        swipeLeft.direction = UISwipeGestureRecognizerDirection.left
        self.view.addGestureRecognizer(swipeLeft)
        
        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(self.respondToSwipeGesture))
        swipeDown.direction = UISwipeGestureRecognizerDirection.down
        self.view.addGestureRecognizer(swipeDown)
        
        let swipeUp = UISwipeGestureRecognizer(target: self, action: #selector(self.respondToSwipeGesture))
        swipeUp.direction = UISwipeGestureRecognizerDirection.up
        self.view.addGestureRecognizer(swipeUp)
        
        //Set table view to reference needed selves
        self.tableView.reloadData()
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)
        tableView.dataSource = self
        tableView.delegate = self
        
        //Set background color of title
        if viewEntries.count > 0{
        dateTitleView.backgroundColor = viewEntries[(viewEntries.count - 1)]["title_color"] as? UIColor
        tableView.backgroundColor = viewEntries[(viewEntries.count - 1)]["background_color"] as? UIColor
        self.view.backgroundColor = viewEntries[(viewEntries.count - 1)]["background_color"] as? UIColor
        //self.view.backgroundColor = UIColor.gray
        } else{
            dateTitleView.backgroundColor = UIColor.white
        }
        
        
        // get the current date and time
        let currentDateTime = Date()
        
        // initialize the date formatter and set the style
        let formatter = DateFormatter()
        // "October 8, 2016"
        formatter.timeStyle = .none
        formatter.dateStyle = .long
        let current_date = formatter.string(from: currentDateTime)
        
        currentDateTitleLable.text = "\(current_date)"
        print("\(current_date)")
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func respondToSwipeGesture(gesture: UIGestureRecognizer) {
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            switch swipeGesture.direction {
            case UISwipeGestureRecognizerDirection.right:
                print("Swiped right")
                performSegue(withIdentifier: "WeekSegue", sender: UISwipeGestureRecognizerDirection.up)
            case UISwipeGestureRecognizerDirection.down:
                print("Swiped down")
                performSegue(withIdentifier: "BackHomeSegue", sender: UISwipeGestureRecognizerDirection.down)
            case UISwipeGestureRecognizerDirection.left:
                print("Swiped left")
            case UISwipeGestureRecognizerDirection.up:
                print("Swiped up")
            default:
                break
            }
        }
    }
    
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewEntries.count
    }
    
    // There is just one row in every section
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    // Set the spacing between sections
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return cellSpacingHeight
    }
    
    // Make the background color show through
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = UIColor.gray
        return headerView
    }
    

    //Populate cell with data
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "EntryCell") as! DayTableViewCell
        
        let entry = viewEntries[indexPath.section]
        
        //Set time in cell
        let date = entry["date_time"] as! Date
        // initialize the date formatter and set the style
        let formatter = DateFormatter()
        // "October 8, 2016"
        formatter.timeStyle = .short
        formatter.dateStyle = .none
        let historic_time = formatter.string(from: date)
        cell.dateLabel.text = "\(historic_time)"
        
        //Set entry number
        //let num_entry = entry["num_entry"] as! Int
        //cell.numEntry.text = "\(num_entry)"
        
        //Set beggining of entry
        let beg_entry = entry["entry"] as! String
        cell.begEntry.text = beg_entry
        
        //Set cell background color
        if viewEntries.count > 0{
            cell.backgroundColor = viewEntries[(viewEntries.count - 1)]["background_color"] as? UIColor
        } else{
            cell.backgroundColor = UIColor.white
        }
        
        //Border
        let border = CALayer()
        let width = CGFloat(2.0)
        border.borderColor = UIColor.lightGray.cgColor
        border.frame = CGRect(x: 15, y: cell.frame.size.height - width, width:  (cell.frame.size.width - 30), height: cell.frame.size.height)
        
        border.borderWidth = width
        cell.layer.addSublayer(border)
        cell.layer.masksToBounds = true
        
        return cell
    }
    

    

}
