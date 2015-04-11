//
//  SettingsViewController.swift
//  tips
//
//  Created by Rachana Bedekar on 4/11/15.
//  Copyright (c) 2015 Rachana Bedekar. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var defaultTipPercentText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view

    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)

        //Read the default Tip Percent and display it in the input text
        
        var defaults = NSUserDefaults.standardUserDefaults()
        
        var defaultTipValue = 0.0;
        
        if (defaults.objectForKey(GlobalConstants.DefaultTipPercentageKey) != nil) {
            defaultTipValue = defaults.doubleForKey(GlobalConstants.DefaultTipPercentageKey)
        }
        
        defaultTipPercentText.text = String(format:"%.2f", defaultTipValue)
    }

    
    @IBAction func onTap(sender: AnyObject) {
        //Dismiss the keyboard
        view.endEditing(true);
    }
    
    
    @IBAction func done(sender: AnyObject) {
        //Dismiss the Settings modal view
        if((self.presentingViewController) != nil){
            self.dismissViewControllerAnimated(false, completion: nil)
        }    
    }
    
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
    
        //Save the default tip percentage in the User Defaults
        
        var tipPercent = (defaultTipPercentText.text as NSString).doubleValue
        
        var defaults = NSUserDefaults.standardUserDefaults()
        
        defaults.setDouble(tipPercent, forKey: GlobalConstants.DefaultTipPercentageKey)
        
        defaults.synchronize()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
