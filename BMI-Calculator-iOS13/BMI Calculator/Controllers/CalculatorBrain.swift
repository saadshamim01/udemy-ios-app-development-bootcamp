//
//  CalculatorBrain.swift
//  BMI Calculator
//
//  Created by Saad Shamim on 13/10/2020.
//  Copyright © 2020 Angela Yu. All rights reserved.
//

import Foundation
import UIKit

struct CalculatorBrain{
    
    var bmi : BMI?
    var bmif:Float = 0.0
    
    mutating func calculateBMI(height:Float, weight:Float){
        
        let bmiValue = (weight)/(height*height)
        if bmiValue < 18.5 {
            bmi = BMI(value: bmiValue, advice: "Eat more pies!!", color: #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1))
            
        }
        else if bmiValue < 24.5{
            bmi = BMI(value: bmiValue, advice: "Fit as a fiddle!", color: #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1))
            
        }
        else {
            bmi = BMI(value: bmiValue, advice: "Eat less pies", color: #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1))
        }
        
    }
    
    
    func getBMIValue() -> String{
        
        let bmiValue = String(format: "%0.1f", bmi?.value ?? 0.0)
        return bmiValue
        
    }
    
    func getAdvice() -> String{
        let bmiAdvice = bmi?.advice ?? "No value"
        return bmiAdvice
    }
    
    func getColor() -> UIColor{
        let bmiColor = bmi?.color ?? .black
        return bmiColor
        
    }
}

