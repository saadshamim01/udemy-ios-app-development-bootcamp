//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    var tip = 0.10
    var numberOfPeople = 2
    var billTotal = 0.0
    var finalResult = "0.0"
    
    
    @IBAction func tipChanged(_ sender: UIButton) {
        
        //Dismissing the keyboard
        billTextField.endEditing(true)
        
        
        //Deselect all the buttons
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        
        //Highlight the button which is selected
        sender.isSelected = true
        
        //Get the title of the pressed button
        let buttonTitle = sender.currentTitle!
        
        //Drop the % sign and storing it as a string
        let buttonTitleWithoutPercentSign = String(buttonTitle.dropLast())
        
        let buttonTitleAsANumber = Double(buttonTitleWithoutPercentSign)!
        
        tip = buttonTitleAsANumber / 100
        
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        
        splitNumberLabel.text = String(format: "%.0f", sender.value)
        numberOfPeople = Int(sender.value)
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        
        //Get the text the user typed in the billTextField
        let bill = billTextField.text!
        
        //If the text is not an empty String ""
        if bill != ""{
            
            billTotal = Double(bill)!
            
            let result = Float(billTotal * (1 + tip)) / Float(numberOfPeople)
            
            finalResult = String(format: "%.2f", result)
            
            
            performSegue(withIdentifier: "goToResult", sender: self)
            
            
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult"{
            
            let resultVC = segue.destination as! ResultsViewController
            
            resultVC.settings = Int(numberOfPeople)
            resultVC.tip = Int(tip)
            resultVC.result = String(finalResult)
            
            
        }
    }
}


