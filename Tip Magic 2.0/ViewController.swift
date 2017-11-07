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
        
        tipControl.selectedSegmentIndex = UserDefaults.standard.integer(forKey: "default_tip_percentage")
        
        let recentBill = UserDefaults.standard.double(forKey: "recent_bill_amount")
        
        let tipPercentages = [0.18, 0.2, 0.22]
        let tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        
        let billAmount = NSString(string: billField.text!).doubleValue
        let tip = billAmount * tipPercentage
        let total = billAmount + tip
        
        tipLabel.text = "$\(tip)"
        totalLabel.text = "$\(total)"
        billField.text = "\(recentBill)"
        
        tipLabel.text = "Tip: " + String(format: "$%.2f", tip)
        totalLabel.text = "Total: " + String(format: "$%.2f", total)
        
        billField.becomeFirstResponder()
        outputView.alpha = 0
        tipControl.alpha = 0
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tipControl.selectedSegmentIndex = UserDefaults.standard.integer(forKey: "default_tip_percentage")
        
        let recentBill = UserDefaults.standard.double(forKey: "recent_bill_amount")
        
        let tipPercentages = [0.18, 0.2, 0.22]
        let tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        
        let billAmount = NSString(string: billField.text!).doubleValue
        let tip = billAmount * tipPercentage
        let total = billAmount + tip
        
        tipLabel.text = "$\(tip)"
        totalLabel.text = "$\(total)"
        billField.text = "\(recentBill)"
        
        tipLabel.text = "Tip: " + String(format: "$%.2f", tip)
        totalLabel.text = "Total: " + String(format: "$%.2f", total)
        
        if (billField.text != ""){
            UIView.animate(withDuration: 0.5, delay: 0.0, options: UIViewAnimationOptions.transitionCurlUp, animations: {
                self.tipControl.alpha = 1.0
                self.outputView.alpha = 1.0
            }, completion: nil)
            
        }
        else {
            UIView.animate(withDuration: 0.5, delay: 0.0, options: UIViewAnimationOptions.transitionFlipFromBottom, animations: {self.tipControl.alpha = 0.0
                self.outputView.alpha = 0.0
            }, completion: nil)
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onEditingChanged(_ sender: Any) {
    
        let tipPercentages = [0.18, 0.2, 0.22]
        let tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        
        let billAmount = NSString(string: billField.text!).doubleValue
        let tip = billAmount * tipPercentage
        let total = billAmount + tip
        
        tipLabel.text = "$\(tip)"
        totalLabel.text = "$\(total)"
        
        tipLabel.text = "Tip: " + String(format: "$%.2f", tip)
        totalLabel.text = "Total: " + String(format: "$%.2f", total)
        
        let defaults = UserDefaults.standard
        defaults.set(billAmount, forKey: "recent_bill_amount")
        defaults.synchronize()
        
        if (billField.text != ""){
            UIView.animate(withDuration: 0.5, delay: 0.0, options: UIViewAnimationOptions.transitionCurlUp, animations: {
                self.tipControl.alpha = 1.0
                self.outputView.alpha = 1.0
                }, completion: nil)
            
        }
        else {
            UIView.animate(withDuration: 0.5, delay: 0.0, options: UIViewAnimationOptions.transitionFlipFromBottom, animations: {self.tipControl.alpha = 0.0
                self.outputView.alpha = 0.0
                }, completion: nil)
            
        }
    
    }
}

