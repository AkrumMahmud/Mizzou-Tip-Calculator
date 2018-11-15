//
//  TipCalculatorViewController.swift
//  Tip Calculator
//
//  Created by Akrum Mahmud on 11/6/18.
//  Copyright © 2018 Akrum Mahmud. All rights reserved.
//

import UIKit

class TipCalculatorViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var txtMealCost: UITextField!
    @IBOutlet weak var txtTipPercentage: UITextField!
    
    @IBOutlet weak var lblTip: UILabel!
    @IBOutlet weak var lblTipTotal: UILabel!
    
    var mealCost = ""
    var tipPercantage = ""
    
    var totalTip: Float = 0.0
    var totalMealCost: Float = 0.0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func btnCalculate(_ sender: UIButton) {
        calculateTip()
    }
    
    @IBAction func btnClear(_ sender: UIButton) {
        clear()
    }
 
    func calculateTip() {
        mealCost = txtMealCost.text!
        tipPercantage = txtTipPercentage.text!
        
        let fMealCost = Float(mealCost)
        let fTipPercentage = Float(tipPercantage)
        
        totalTip = fMealCost! * (fTipPercentage! / 100)
        totalMealCost = fMealCost! + totalTip 
        
        printTip()
        
        hideKeyboard()
    }
    
    func printTip() {
        let formatTip = String(format: "%0.2f", totalTip)
        let formatTotal = String(format: "%0.2f", totalMealCost)
        
        lblTip.text = "Tip: $\(formatTip)"
        lblTipTotal.text = "$\(formatTotal)"
    }
    
    func clear() {
        txtMealCost.text = ""
        txtTipPercentage.text = ""
        
        lblTip.text = "Tip: $0.00"
        lblTipTotal.text = "$0.00"
        
        hideKeyboard()
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        hideKeyboard()
    }
    
    func hideKeyboard(){
        txtMealCost.resignFirstResponder()
        txtTipPercentage.resignFirstResponder()
    
    }
    
    
}
