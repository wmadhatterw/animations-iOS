//
//  ViewController.swift
//  Animations
//
//  Created by Seth Walton on 8/22/18.
//  Copyright © 2018 Seth Walton. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func fadeIn(_ sender: Any) {
        image.alpha = 0
        
        UIView.animate(withDuration: 1) {
            self.image.alpha = 1
        }
    }
    @IBAction func slideIn(_ sender: Any) {
        
        image.center = CGPoint(x: image.center.x - 500, y: image.center.y)
        UIView.animate(withDuration: 2){
            self.image.center = CGPoint(x: self.image.center.x + 500, y: self.image.center.y)
        }
    }
    
    @IBAction func grow(_ sender: Any) {
        
        image.frame = CGRect(x: 0, y: 0, width: 0, height: 0)
        
        UIView.animate(withDuration: 1){
            self.image.frame = CGRect(x: 0, y: 0, width: 300, height: 300)
        }
    }
    
    @IBOutlet var button: UIButton!
    @IBOutlet var image: UIImageView!
    
    var counter = 1
    
    var isAnimating = false
    
    var timer = Timer()
    
    @objc func animate() {
        
        image.image = UIImage(named: "frame_\(counter)_delay-0.08s.gif")
        
        counter += 1
        
        if counter == 26{
            counter = 0
        }
    }
    @IBAction func next(_ sender: Any) {
        
        if isAnimating{
            timer.invalidate()
            isAnimating = false
            button.setTitle("Start", for: [])
        } else {
            isAnimating = true
             button.setTitle("Stop", for: [])
            timer = Timer.scheduledTimer(timeInterval: 0.08, target: self, selector: #selector(ViewController.animate), userInfo: nil, repeats: true)
        }
       
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

