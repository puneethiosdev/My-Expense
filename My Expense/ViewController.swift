//
//  ViewController.swift
//  My Expense
//
//  Created by Puneet JR on 15/04/17.
//  Copyright © 2017 Puneet. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, UIScrollViewDelegate {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var phoneBill: UITextField!
    @IBOutlet weak var waterBill: UITextField!
    @IBOutlet weak var electricBill: UITextField!
    @IBOutlet weak var internetBill: UITextField!
    @IBOutlet weak var loanPayment: UITextField!
    @IBOutlet weak var momMoneyTransfer: UITextField!
    @IBOutlet weak var dthBill: UITextField!
    @IBOutlet weak var petrolBill: UITextField!
    @IBOutlet weak var totalBillExpenseDisplay: UILabel!
    @IBOutlet weak var calculateTotalBtn: UIButton!


    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        InitializeTextFields()

    }
    
    func InitializeTextFields() {
        phoneBill.delegate = self
        phoneBill.keyboardType = UIKeyboardType.numberPad
        
        waterBill.delegate = self
        waterBill.keyboardType = UIKeyboardType.numberPad
        
        electricBill.delegate = self
        electricBill.keyboardType = UIKeyboardType.numberPad
        
        internetBill.delegate = self
        internetBill.keyboardType = UIKeyboardType.numberPad
        
        loanPayment.delegate = self
        loanPayment.keyboardType = UIKeyboardType.numberPad
        
        momMoneyTransfer.delegate = self
        momMoneyTransfer.keyboardType = UIKeyboardType.numberPad
        
        dthBill.delegate = self
        dthBill.keyboardType = UIKeyboardType.numberPad
        
        petrolBill.delegate = self
        petrolBill.keyboardType = UIKeyboardType.numberPad
    }
    
    // while editing a text field.
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return true
    }
    
    // MARK: UITextFieldDelegate events and related methods
    func textFieldDidBeginEditing(_ textField: UITextField) {
//        let currentText = textField.text
        
        if (textField == loanPayment) {
            scrollView.setContentOffset(CGPoint(x: 0, y: 100), animated: true)
        } else if (textField == momMoneyTransfer) {
            scrollView.setContentOffset(CGPoint(x: 0, y: 100), animated: true)
        } else if (textField == dthBill) {
            scrollView.setContentOffset(CGPoint(x: 0, y: 100), animated: true)
        } else if (textField == petrolBill) {
            scrollView.setContentOffset(CGPoint(x: 0, y: 250), animated: true)
        } else {
            scrollView.setContentOffset(CGPoint(x: 0, y: 0), animated: true)
        }
        
        if (textField.text == "0") {
            textField.text = ""
        }

    }

    func textFieldDidEndEditing(_ textField: UITextField) {
        scrollView.setContentOffset(CGPoint(x: 0, y: 0), animated: true)
        
        if (textField.text == "") {
            textField.text = "0"
        }
    }
    
    @IBAction func calculateTotal(_ sender: UIButton) {
        let phone = Int(phoneBill.text!)
        let water = Int(waterBill.text!)
        let electric = Int(electricBill.text!)
        let internet = Int(internetBill.text!)
        let loan = Int(loanPayment.text!)
        let mom = Int(momMoneyTransfer.text!)
        let dth = Int(dthBill.text!)
        let petrol = Int(petrolBill.text!)
        
        
        
        let total = Int(phone! + water! + electric! + internet! + loan! + mom! + dth! + petrol!)
        
        totalBillExpenseDisplay.text =  "\(total)"
    }
}

