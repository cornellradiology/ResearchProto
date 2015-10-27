//
//  SurveyViewController.swift
//  HelloHealth
//
//  Created by TsengKuo-Wei on 10/26/15.
//  Copyright © 2015 Kuowei Tseng. All rights reserved.
//

import UIKit
import ResearchKit
class SurveyViewController: UIViewController , ORKTaskViewControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(animated: Bool) {
        let myStep = ORKInstructionStep(identifier: "intro")
        myStep.title = "Hello Health Kit"
        let task = ORKOrderedTask(identifier: "task", steps: [myStep])
        let taskViewController = ORKTaskViewController(task: task, taskRunUUID: nil)
        taskViewController.delegate = self
        presentViewController(taskViewController, animated: true, completion: nil)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func taskViewController(taskViewController: ORKTaskViewController,
        didFinishWithReason reason: ORKTaskViewControllerFinishReason,
        error: NSError?) {
            let taskResult = taskViewController.result
            // You could do something with the result here.
            //taskResult.
            // Then, dismiss the task view controller.
            dismissViewControllerAnimated(true, completion: nil)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
