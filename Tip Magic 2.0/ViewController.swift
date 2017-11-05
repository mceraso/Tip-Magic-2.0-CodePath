//
//  ViewController.swift
//  Tip Magic 2.0
//
//  Created by Michael Ceraso on 12/31/15.
//  Copyright © 2015 Michael Ceraso. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var outputView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.title = "Tip Magic"
        tipLabel.text = "$0.00"
        totalLabel.text = "$0.00"
        billField.becomeFirstResponder()
        outputView.alpha = 0
        tipControl.alpha = 0
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        tipControl.selectedSegmentIndex = NSUserDefaults.standardUserDefaults().integerForKey("default_tip_percentage")
        
        let recentBill = NSUserDefaults.standardUserDefaults().doubleForKey("recent_bill_amount")
        
        let tipPercentages = [0.18, 0.2, 0.22]
        let tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        
        let billAmount = NSString(string: billField.text!).doubleValue
        let tip = billAmount * tipPercentage
        let total = billAmount + tip
        
        tipLabel.text = "$\(tip)"
        totalLabel.text = "$\(total)"
        billField.text = "\(recentBill)"
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    
    @IBAction func onEditingChanged(sender: AnyObject) {
    
        let tipPercentages = [0.18, 0.2, 0.22]
        let tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        
        let billAmount = NSString(string: billField.text!).doubleValue
        let tip = billAmount * tipPercentage
        let total = billAmount + tip
        
        tipLabel.text = "$\(tip)"
        totalLabel.text = "$\(total)"
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setDouble(billAmount, forKey: "recent_bill_amount")
        defaults.synchronize()
        
        if (billField.text != ""){
            UIView.animateWithDuration(0.5, delay: 0.0, options: UIViewAnimationOptions.TransitionCurlUp, animations: {
                self.tipControl.alpha = 1.0
                self.outputView.alpha = 1.0
                }, completion: nil)
            
        }
        else {
            UIView.animateWithDuration(0.5, delay: 0.0, options: UIViewAnimationOptions.TransitionFlipFromBottom, animations: {self.tipControl.alpha = 0.0
                self.outputView.alpha = 0.0
                }, completion: nil)
            
        }
    
    }
}

