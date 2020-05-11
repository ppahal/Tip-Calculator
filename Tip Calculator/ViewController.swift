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
    var locale = NSLocale.current
    
    override func viewDidLoad() {
        super.viewDidLoad()
        billField.keyboardType = UIKeyboardType.decimalPad
        // Do any additional setup after loading the view.
        UIView.animate(withDuration: 0.4, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 1, options: [], animations: { () -> Void in //self.trayView.center = self.trayDown }, completion: nil)
        }, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let settingsVC = segue.destination as! SettingsViewController
        settingsVC.tip1 = tip1
        settingsVC.tip2 = tip2
        settingsVC.tip3 = tip3
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.billField.becomeFirstResponder()
        locale = NSLocale.autoupdatingCurrent
        let exitDate = UserDefaults.standard.object(forKey: "exitDate") as? Date
        //print("\(exitDate)")
     /*   if(exitDate?.addingTimeInterval(10*60) ?? Date.init() < Date.init()){
            print("IN")
             NotificationCenter.default.addObserver(self, selector: #selector(textChanged(_:)), name: UITextField.textDidChangeNotification, object: nil)        }
    //    NotificationCenter.removeObserver(_:)*/
    }
    
 /*   @objc func textChanged(_ notification: Notification){
        print("HERE")
        let data = notification.userInfo as! [String : Int]
        for key in data.keys{
            billField.text = key
            print(key)
        }
    }
   */
    override func viewDidDisappear(_ animated: Bool) {
     /*   let bill = (billField.text ?? "") as String
        let value = [bill : 0] as [String : Int]
        NotificationCenter.default.post(name: UITextField.textDidChangeNotification, object: billField, userInfo: value)
        UserDefaults.standard.set(Date(), forKey:"exitDate")*/
    }
    
    @IBAction func unwindToTC(_ sender: UIStoryboardSegue){}
    
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
        
        tipLabel.text = format.string(from: tipNS)
        totalLabel.text = format.string(from: total)
        
    }
    
}

