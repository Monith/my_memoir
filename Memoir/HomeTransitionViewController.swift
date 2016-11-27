//
//  HomeTransitionViewController.swift
//  Memoir
//
//  Created by Monith Ilavarasan on 11/20/16.
//  Copyright © 2016 Sophia KC. All rights reserved.
//

import UIKit

class HomeTransitionViewController: UIViewController {
    
    @IBOutlet weak var homeTextView: UITextView!
    @IBOutlet weak var titleView: UIView!
    
    //Consistent Colors in the homescreen
    var hue:CGFloat!
    
    //Entry Count
    var entryCount = 1
    
    //Data storage for Entries
    var entries: [[String:Any]] = []
    
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
        
        setColors()
        
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        homeTextView.becomeFirstResponder()
        
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
                setColors()
                textStore()
            case UISwipeGestureRecognizerDirection.down:
                print("Swiped down")
            case UISwipeGestureRecognizerDirection.left:
                print("Swiped left")
            case UISwipeGestureRecognizerDirection.up:
                print("Swiped up")
                textStore()
                performSegue(withIdentifier: "TodaySegue", sender: UISwipeGestureRecognizerDirection.up)
                
            default:
                break
            }
        }
    }
    
    func generateRandomLightColor() -> UIColor {
        // Randomly generate number in closure
        
        hue = CGFloat(Float(arc4random()) / Float(UINT32_MAX))
        //let saturation = CGFloat(Float(arc4random()) / Float(UINT32_MAX))
        let saturation: CGFloat = 0.1
        //let brightness = CGFloat(Float(arc4random()) / Float(UINT32_MAX))
        let brightness: CGFloat = 0.95
        let alpha:CGFloat = 1
        
        var tempColor:UIColor
        
        
        tempColor = UIColor.init(hue:hue,
                         saturation: saturation,
                         brightness: brightness,
                         alpha: alpha)
        
        
        //return UIColor(red: red, green: green, blue: blue, alpha: 1)
        return tempColor
    }
    
    func generateRandomRichColor() -> UIColor {
        // Randomly generate number in closure
        
        //let hue = CGFloat(Float(arc4random()) / Float(UINT32_MAX))
        
        //let saturation = CGFloat(Float(arc4random()) / Float(UINT32_MAX))
        let saturation: CGFloat = 0.35
        //let brightness = CGFloat(Float(arc4random()) / Float(UINT32_MAX))
        let brightness: CGFloat = 0.95
        let alpha:CGFloat = 1
        
        var tempColor:UIColor
        
        
        tempColor = UIColor.init(hue:hue,
                                 saturation: saturation,
                                 brightness: brightness,
                                 alpha: alpha)
        
        
        //return UIColor(red: red, green: green, blue: blue, alpha: 1)
        return tempColor
    }
    
    func setColors() {
        self.view.backgroundColor = generateRandomLightColor()
        self.homeTextView.backgroundColor = self.view.backgroundColor
        self.titleView.backgroundColor = generateRandomRichColor()
        
    }
    
    func textStore() {
        
        //Create and store each entry
        let entry: [String:Any]
        entry = [
            "num_entry": entryCount,
            "entry": homeTextView.text,
            "date_time": NSDate(),
            "title_color":self.titleView.backgroundColor,
            "background_color":self.view.backgroundColor
        ]
        
        //append dictionary array
        entries.append(entry)
        
        //Set home text view to nothing
        homeTextView.text = ""
        
        //Increment entry count
        entryCount += 1
        
        //check
        print(entries)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let destinationViewController = segue.destination as! FirstCalendarViewController
        
        destinationViewController.viewEntries = entries
        
    }
    
    
}
