//
//  ViewController.swift
//  SwiftTipCalculator
//
//  Created by Yoko Yamaguchi on 9/26/15.
//  Copyright © 2015 Yoko Yamaguchi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var billTextfield : UITextField = UITextField()
    var alertLabel : UILabel = UILabel()
    var taxLabel : UILabel = UILabel()
    var sliderLabel : UILabel = UILabel()
    var percent = 0.0

    override func viewDidLoad() {
        super.viewDidLoad()
        self.makeLayout()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func makeLayout() {
        let screenSize: CGRect = UIScreen.mainScreen().bounds
        let screenWidth : CGFloat = screenSize.width
        //let screenHeight : CGFloat = screenSize.height
        let labelWidth : CGFloat = 200
        let labelHeight : CGFloat = 20
        
        /* Tip Calculator Label */
        let helloLabel = UILabel(frame: CGRectMake((screenWidth / 2) - (labelWidth / 2), 60, labelWidth, labelHeight))
        helloLabel.textAlignment = NSTextAlignment.Center
        helloLabel.text = "Tip Calculator"
        self.view.addSubview(helloLabel)
        
        /* Bill Label */
        let billLabel = UILabel(frame: CGRectMake((screenWidth / 2) - (labelWidth / 2), 130, 200, 20))
        billLabel.textAlignment = NSTextAlignment.Center;
        billLabel.text = "Total Bill:"
        self.view.addSubview(billLabel)
        
        /* Bill Textfield */
        billTextfield.frame = CGRectMake((screenWidth / 2) - (labelWidth / 2), 150, 200, 20)
        billTextfield.borderStyle = UITextBorderStyle.Line
        self.view.addSubview(billTextfield)
        
        /* Slider Label */
        sliderLabel.frame = CGRectMake((screenWidth / 2) - (labelWidth / 2), 180, 200, 20)
        sliderLabel.textAlignment = NSTextAlignment.Center;
        sliderLabel.text = "Tax percentage"
        self.view.addSubview(sliderLabel)
        
        /* Tip Slider */
        let tipSlider = UISlider(frame: CGRectMake((screenWidth / 2) - (labelWidth / 2), 210, 200, 20))
        tipSlider.minimumValue = 0
        tipSlider.maximumValue = 100
        tipSlider.addTarget(self, action:"sliderValueDidChange:", forControlEvents: UIControlEvents.ValueChanged)
        self.view.addSubview(tipSlider)
        
        /* Calculate Button */
        let calculateButton = UIButton(type:UIButtonType.System) as UIButton
        calculateButton.frame = CGRectMake((screenWidth / 2) - (labelWidth / 2), 270, 200, 20)
        calculateButton.backgroundColor = UIColor.whiteColor()
        calculateButton.setTitle("Calculate Tax", forState: UIControlState.Normal)
        calculateButton.addTarget(self, action:"calculate:", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(calculateButton)
        
        /* Alert Label */
        alertLabel.frame = CGRectMake((screenWidth / 2) - (labelWidth / 2), 300, 200, 20)
        alertLabel.textAlignment = NSTextAlignment.Center;
        alertLabel.text = ""
        alertLabel.textColor = UIColor.redColor()
        self.view.addSubview(alertLabel)
        
        /* Tax Label */
        taxLabel.frame = CGRectMake((screenWidth / 2) - (labelWidth / 2), 300, 200, 20)
        taxLabel.textAlignment = NSTextAlignment.Center;
        taxLabel.text = ""
        self.view.addSubview(taxLabel)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func calculate(sender:UIButton!) {
        validateNumeric()
        let result = calculateTax(Double(billTextfield.text!)!, percentage: (percent))
        taxLabel.text = NSString(format: "Your tax is $%.2f", result) as String
    }
    
    func validateNumeric() {
        alertLabel.text = ""
        // toInt returns optional b/c of Int?
        let billTotal = Double(billTextfield.text!)
        // check a and b before unwrapping using !
        if ((billTotal) != nil) {
            NSLog("Numerical")
            //var ans = a! + b!
            //answerLabel.text = "Answer is \(ans)"       // answerLabel ie UILa
        } else {
            NSLog("Not numerical")
            alertLabel.text = "Bill has to be numeric"
            self.view.addSubview(alertLabel)
        }
    }
    
    func sliderValueDidChange(sender:UISlider!) {
        sliderLabel.text = NSString(format: "%.1f%%", sender.value) as String
        percent = Double(sender.value)
        NSLog(sliderLabel.text!)
        
    }
    
    func calculateTax(totalBill:Double, percentage:Double) -> Double {
        return (totalBill * percentage * 0.01)
    }
    
    

}

