//
//  SettingsViewController.swift
//  Tip Calculator
//
//  Created by Priya Pahal on 5/10/20.
//  Copyright © 2020 Codepath. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var tipField1: UITextField!
    @IBOutlet weak var tipField2: UITextField!
    @IBOutlet weak var tipField3: UITextField!
    
    var tip1 = 0.00
    var tip2 = 0.00
    var tip3 = 0.00
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let tipCalculatorVC = segue.destination as! ViewController
        tipCalculatorVC.tip1 = tip1
        tipCalculatorVC.tip2 = tip2
        tipCalculatorVC.tip3 = tip3
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tipField1.text = "\(integer_t(tip1*100))"
        tipField2.text = "\(integer_t(tip2*100))"
        tipField3.text = "\(integer_t(tip3*100))"
        tipField1.keyboardType = UIKeyboardType.decimalPad
        tipField1.keyboardAppearance = UIKeyboardAppearance.dark
        tipField2.keyboardType = UIKeyboardType.decimalPad
        tipField2.keyboardAppearance = UIKeyboardAppearance.dark
        tipField3.keyboardType = UIKeyboardType.decimalPad
        tipField3.keyboardAppearance = UIKeyboardAppearance.dark
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.tipField1.becomeFirstResponder()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func enterNewTips(_ sender: Any) {
        tip1 = Double(tipField1.text!) ?? 0
        tip1 = tip1/100
        tip2 = Double(tipField2.text!) ?? 0
        tip2 = tip2/100
        tip3 = Double(tipField3.text!) ?? 0
        tip3 = tip3/100
        
    }
}
