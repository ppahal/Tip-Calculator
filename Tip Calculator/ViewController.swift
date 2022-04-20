//
//  ViewController.swift
//  Tip Calculator
//
//  Created by Priya Pahal on 1/22/20.
//  Copyright © 2020 Codepath. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // Outlets
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    // Variables
    var tip1 = 0.15
    var tip2 = 0.18
    var tip3 = 0.20
    var locale = NSLocale.current
    
    /*
     * When the view loads do the following...
     */
    override func viewDidLoad() {
        super.viewDidLoad()
        // Setup the keyboard for inputting our total
        billField.keyboardType = UIKeyboardType.decimalPad
        billField.keyboardAppearance = UIKeyboardAppearance.dark
        
        // Possible Animation?
//        UIView.animate(withDuration: 0.4, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 1, options: [], animations: { () -> Void in //self.trayView.center = self.trayDown }, completion: nil)
//        }, completion: nil)
        
        // UserDefaults
        let userDefaults = UserDefaults.standard
        if userDefaults.double(forKey: "tip1") != 0.00{
            tip1 = userDefaults.double(forKey: "tip1")
        }
        if userDefaults.double(forKey: "tip2") != 0.00{
            tip2 = userDefaults.double(forKey: "tip2")
        }
        if userDefaults.double(forKey: "tip3") != 0.00{
            tip3 = userDefaults.double(forKey: "tip3")
        }
        
        // Call the tip calculation function
        calculateTip((Any).self)
    }
    
    /*
     * Prepares for the switch to the Settings Screen.
     */
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let settingsVC = segue.destination as! SettingsViewController
        // Set the tips
        settingsVC.tip1 = tip1
        settingsVC.tip2 = tip2
        settingsVC.tip3 = tip3
    }
    
    /*
     * When the view appears do the following...
     */
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        // Set the keyboard to appear
        self.billField.becomeFirstResponder()
        // Set the currency to the phone's current country
        locale = NSLocale.autoupdatingCurrent
        // FIXME: More user default stuff
//        let userDefaults = UserDefaults.standard
//        if(userDefaults.object(forKey: "Last Date") != nil){
//            let previousDate = userDefaults.object(forKey: "Last Date") as! Date
//            let billValue = userDefaults.object(forKey: "Bill") as! String
//            let currentDate = Date()
//            let time = currentDate.timeIntervalSince(previousDate)
//            if(time <= 600){
//                billField.text = billValue
//            }
//        }
    }
    
    /*
     * When the view disappears do the following...
     */
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
//        let userDefaults = UserDefaults.standard
//        //userDefaults.set(billField.text, forKey: "Bill")
//        userDefaults.set(Date(), forKey: "Last Date")
    }
    
    
    @IBAction func unwindToTC(_ sender: UIStoryboardSegue){
        let userDefaults = UserDefaults.standard
        userDefaults.set(tip1, forKey: "tip1")
        userDefaults.set(tip2, forKey: "tip2")
        userDefaults.set(tip3, forKey: "tip3")
        calculateTip((Any).self)
    }
    
    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
        
    }

    @IBAction func calculateTip(_ sender: Any) {
        let format = NumberFormatter()
        //let symbol = locale.currencySymbol! as String
        format.locale = NSLocale.autoupdatingCurrent
        format.numberStyle = .currency
        format.currencyDecimalSeparator = locale.decimalSeparator
        format.currencyGroupingSeparator = locale.groupingSeparator
        
        // Get
        let bill = Double(billField.text!) ?? 0
        
        // Calculate
        let tipPercentages = [tip1, tip2, tip3]
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let tipNS = tip as NSNumber
        let total = (bill + tip) as NSNumber
        
        // Update
        tipControl.setTitle("\(integer_t(tip1*100))%", forSegmentAt: 0)
        tipControl.setTitle("\(integer_t(tip2*100))%", forSegmentAt: 1)
        tipControl.setTitle("\(integer_t(tip3*100))%", forSegmentAt: 2)
        
        //Format & Label
        tipLabel.text = format.string(from: tipNS)
        totalLabel.text = format.string(from: total)
        
    }
    
}
