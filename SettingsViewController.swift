//
//  SettingsViewController.swift
//  Tip Magic 2.0
//
//  Created by Michael Ceraso on 12/31/15.
//  Copyright © 2015 Michael Ceraso. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var preferredControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = "Settings"
        
        let preferredTip = NSUserDefaults.standardUserDefaults().integerForKey("default_tip_percentage")
        preferredControl.selectedSegmentIndex = preferredTip

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func onPreferredChange(sender: AnyObject) {
        
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setInteger(preferredControl.selectedSegmentIndex, forKey: "default_tip_percentage")
        defaults.synchronize()
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
