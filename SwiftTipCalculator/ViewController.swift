//
//  ViewController.swift
//  SwiftTipCalculator
//
//  Created by Yoko Yamaguchi on 9/26/15.
//  Copyright © 2015 Yoko Yamaguchi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.makeLayout()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func makeLayout() {
        let screenSize: CGRect = UIScreen.mainScreen().bounds
        let screenWidth : CGFloat = screenSize.width
        let screenHeight : CGFloat = screenSize.height
        let labelWidth : CGFloat = 200
        let labelHeight : CGFloat = 20
        
        /* Hello Swift Label */
        let helloLabel = UILabel(frame: CGRectMake((screenWidth / 2) - (labelWidth / 2), ((screenHeight / 2) - (labelHeight / 2)), labelWidth, labelHeight))
        helloLabel.textAlignment = NSTextAlignment.Center
        helloLabel.text = "Hello Swift!"
        self.view.addSubview(helloLabel)
        
        /* Name Label */
        let nameLabel = UILabel(frame: CGRectMake((screenWidth / 2) - (labelWidth / 2), 350, 200, 20))
        nameLabel.textAlignment = NSTextAlignment.Center;
        nameLabel.text = "Yoko Yamaguchi"
        self.view.addSubview(nameLabel)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

