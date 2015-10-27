//
//  SurveyTableViewController.swift
//  HelloHealth
//
//  Created by TsengKuo-Wei on 10/26/15.
//  Copyright © 2015 Kuowei Tseng. All rights reserved.
//

import UIKit
import ResearchKit
class SurveyTableViewController: UITableViewController , ORKTaskViewControllerDelegate {
    let taskTypes: NSMutableArray = NSMutableArray()
    var taskSteps: NSMutableArray = NSMutableArray()
    var taskContents: NSMutableArray = NSMutableArray()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBarHidden = false
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        taskTypes.addObject("survey")
        taskSteps.addObject(["intro", "question", "summary"])
        //let contentObj =
        //taskContents.setObject(titleObj, forKey: "title")
        //taskContents["title"]?.addObject(["Welcome to survey Beta", "Do you love this app?", "Thanks for testing this app"])
        
        taskContents.addObject(
            NSDictionary.init(dictionary:
                ["title": ["Welcome to survey Beta", "Do you love this app?", "Thanks for testing this app"],
                 "text": ["My noob app testing", "", "Thank you for using this app"]]))
        
        taskTypes.addObject("survey")
        taskSteps.addObject(["intro", "question", "summary"])
        taskContents.addObject(
            NSDictionary.init(dictionary:
                ["title": ["I love Cornell Tech", "Do you love CT too?", "CT <3"],
                    "text": ["Great school", "", "<3<3 ^_^"]]))
        
        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        //subTableView!.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return taskTypes.count
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
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) ->UITableViewCell {
        //var cell : UITableViewCell?
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)
        print("OMG")
        /*if cell == nil{
            cell = UITableViewCell.init(style: .Subtitle, reuseIdentifier: "cell")
        }*/
        //print(taskContents["title"]!.objectAtIndex(0))
        //print(taskTypes)
        cell.textLabel?.text = taskContents[indexPath.row].objectForKey("title")!.objectAtIndex(0) as? String
        //let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)

        // Configure the cell...

        return cell
    }

    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let taskType = taskTypes.objectAtIndex(indexPath.row)
        let taskStep = taskSteps.objectAtIndex(indexPath.row)
        let taskContent = taskContents
        let SurveyTaskManager = SurveyTask()
        let task:ORKTask =  SurveyTaskManager.createTask(taskType as! String, taskStep: taskStep as! NSArray, taskContent: taskContent[indexPath.row] as! NSDictionary)
        let taskViewController = ORKTaskViewController(task: task, taskRunUUID: nil)
        taskViewController.delegate = self
        presentViewController(taskViewController, animated: true, completion: nil)
    }
    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
