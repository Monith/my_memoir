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
        
        self.view.backgroundColor = generateRandomLightColor()
        self.homeTextView.backgroundColor = self.view.backgroundColor
        self.titleView.backgroundColor = generateRandomLightColor()
        
        // Do any additional setup after loading the view.
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
                self.view.backgroundColor = generateRandomLightColor()
                self.homeTextView.backgroundColor = self.view.backgroundColor
                self.titleView.backgroundColor = generateRandomLightColor()
            case UISwipeGestureRecognizerDirection.down:
                print("Swiped down")
            case UISwipeGestureRecognizerDirection.left:
                print("Swiped left")
            case UISwipeGestureRecognizerDirection.up:
                print("Swiped up")
                performSegue(withIdentifier: "TodaySegue", sender: UISwipeGestureRecognizerDirection.up)
                
            default:
                break
            }
        }
    }
    
    func generateRandomLightColor() -> UIColor {
        // Randomly generate number in closure
        
        let hue = CGFloat(Float(arc4random()) / Float(UINT32_MAX))
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
    
    
    
}
