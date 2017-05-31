//
//  ViewController.swift
//  SMFDemo
//
//  Created by Andre Morais on 3/12/16.
//  Copyright © 2016 Andre Morais. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var txtCepExample: SwiftMaskField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setMaksInTextFields()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func setMaksInTextFields(){
        
        txtCepExample.maskString = "NNNNN-NNN"
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}

