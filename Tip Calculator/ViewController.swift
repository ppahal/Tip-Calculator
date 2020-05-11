//
//  ViewController.swift
//  Tip Calculator
//
//  Created by Priya Pahal on 1/22/20.
//  Copyright © 2020 Codepath. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    var tip1 = 0.15
    var tip2 = 0.18
    var tip3 = 0.20
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let settingsVC = segue.destination as! SettingsViewController
        settingsVC.tip1 = tip1
        settingsVC.tip2 = tip2
        settingsVC.tip3 = tip3
    }
    
    @IBAction func unwindToTC(_ sender: UIStoryboardSegue){}
    
    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
        
    }

    @IBAction func calculateTip(_ sender: Any) {
        // Get
        let bill = Double(billField.text!) ?? 0
        
        // Calculate
        let tipPercentages = [tip1, tip2, tip3]
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        
        // Update
        tipControl.setTitle("\(integer_t(tip1*100))%", forSegmentAt: 0)
        tipControl.setTitle("\(integer_t(tip2*100))%", forSegmentAt: 1)
        tipControl.setTitle("\(integer_t(tip3*100))%", forSegmentAt: 2)
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        
    }
    
}

