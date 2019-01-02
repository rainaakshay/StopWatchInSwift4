//
//  ViewController.swift
//  Stopwatch
//
//  Created by apple on 14/12/18.
//  Copyright © 2018 Seraphic. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var time: UILabel!
    @IBOutlet weak var start: UIButton!
    @IBOutlet weak var reset: UIButton!
    
    @IBOutlet weak var tableView: UITableView!
    @objc var counter : Double = 0.0
    var timer : Timer!
    var flag : Bool = false
    var resetornot:Bool = false
    
   
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        timer = Timer()
        
        start.layer.cornerRadius = 0.4 * start.bounds.size.width
        start.backgroundColor = UIColor.white
       // start.setTitleColor(UIColor.blue, for: .highlighted)
        
        reset.layer.cornerRadius = 0.4 * start.bounds.size.width
        reset.backgroundColor = UIColor.white
        reset.setTitleColor(UIColor.gray, for: .disabled)
        
        reset.isEnabled = false
        tableView.backgroundColor = UIColor.lightGray; 
    }
   
    @IBAction func startbttn(_ sender: Any) {
        if(flag == false)
        {
            flag = true
            resetornot = true
            reset.isEnabled=true
            start.setTitle("Pause", for: .normal)
            timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(ViewController.neww), userInfo: nil, repeats: true)
            
        }
        else if(flag == true)
        {
            flag = false
            
            if(resetornot != true)
            {
            reset.isEnabled=false
            }
            start.setTitle("Start", for: .normal)
            timer.invalidate()
        }
        
        
        
    }
    @IBAction func resetbttn(_ sender: Any) {
        
        if(resetornot == true)
        {
        timer.invalidate()
            time.text="00:00:00"
            counter = 0.0
        reset.isEnabled=false
            start.setTitle("Start", for: .normal)
            flag = false
        }
        
    }
    @objc func neww ()
    {
        counter += 0.1
        var minutes : String = "\((Int)(counter/60))"
        if (Int)(counter / 60) < 10 {
            minutes = "0\((Int)(counter / 60))"
        }
        var seconds:String = String(format: "%.2f", counter.truncatingRemainder(dividingBy: 60))
        if counter.truncatingRemainder(dividingBy: 60) < 10 {
            seconds = "0" + seconds
        }
       
        
        time.text = minutes + ":" + seconds
    }

}

