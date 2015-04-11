//
//  ViewController.swift
//  tips
//
//  Created by Rachana Bedekar on 4/10/15.
//  Copyright (c) 2015 Rachana Bedekar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tipLabel.text = "$0.00"
        totalLabel.text = "$0.00"
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        //If the user changes the default tip in Settings and returns, evaluate the tip to reflect the change automatically
        
        evaluateTip()
    }


    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
    
    
    @IBAction func onEditingChanged(sender: AnyObject) {
        //With each key press, evaluate the tip and total
        evaluateTip()
    }
    
    func evaluateTip() {
        var tipPercentages = [0, 0.18, 0.2, 0.22]
        
        //Read the default tip percentage and set it in the array of tipPercentages
        
        var defaults = NSUserDefaults.standardUserDefaults()
        
        if (defaults.objectForKey(GlobalConstants.DefaultTipPercentageKey) != nil) {
            var defaultTipValue = defaults.doubleForKey(GlobalConstants.DefaultTipPercentageKey)
            
            tipPercentages[0] = defaultTipValue / 100
        }
        
        //Use the tip percentage corresponding to the segmented control's selected index
        var tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]

        var billAmount = (billField.text as NSString).doubleValue
        
        var tip = billAmount * tipPercentage
        
        var total = billAmount+tip
        
        //Update the tip and total
        tipLabel.text = String(format: "%.2f", tip)
        totalLabel.text = String(format: "%.2f", total)
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

