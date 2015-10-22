//
//  ViewController.swift
//  HelloHealth
//
//  Created by TsengKuo-Wei on 9/23/15.
//  Copyright © 2015 Kuowei Tseng. All rights reserved.
//

import UIKit
import ResearchKit

class ViewController: UIViewController, ORKTaskViewControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(animated: Bool) {
        let myStep = ORKInstructionStep(identifier: "intro")
        myStep.title = "Hello Health Kit"
        let task = ORKOrderedTask(identifier: "task", steps: [myStep])
        let taskViewController = ORKTaskViewController(task: task, taskRunUUID: nil)
        taskViewController.delegate = self
        presentViewController(taskViewController, animated: true, completion: nil)
    }
    func taskViewController(taskViewController: ORKTaskViewController,
        didFinishWithReason reason: ORKTaskViewControllerFinishReason,
        error: NSError?) {
            let taskResult = taskViewController.result
            // You could do something with the result here.
            
            // Then, dismiss the task view controller.
            dismissViewControllerAnimated(true, completion: nil)
    }
}

