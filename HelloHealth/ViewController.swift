//
//  ViewController.swift
//  HelloHealth
//
//  Created by TsengKuo-Wei on 9/23/15.
//  Copyright © 2015 Kuowei Tseng. All rights reserved.
//

import UIKit


class ViewController: UIViewController{

    @IBOutlet weak var BStartSurvey: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.navigationController?.navigationBarHidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(animated: Bool) {
        self.navigationController?.navigationBarHidden = true
    }
    
    @IBAction func StartSurveyPressed(sender: UIButton) {
        
    }
}

