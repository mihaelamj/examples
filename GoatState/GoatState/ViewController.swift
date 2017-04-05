//
//  ViewController.swift
//  GoatState
//
//  Created by Mihaela Mihaljevic Jakic on 22/03/2017.
//  Copyright © 2017 Mihaela Mihaljevic Jakic. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var goat: GoatProgressView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        goat.animateFromBottomAnimation(percentHeight: 0.5)
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

