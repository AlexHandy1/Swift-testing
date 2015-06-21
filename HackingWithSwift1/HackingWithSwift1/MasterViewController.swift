//
//  MasterViewController.swift
//  HackingWithSwift1
//
//  Created by Alexander Handy on 21/06/2015.
//  Copyright (c) 2015 Alexander Handy. All rights reserved.
//

import UIKit

class MasterViewController: UITableViewController {

    var detailViewController: DetailViewController? = nil
    var objects = [String]() // double () means create straight away
    //this is a standard set-up for an array of any object >> can change directly to a string


    override func awakeFromNib() {
        super.awakeFromNib()
        if UIDevice.currentDevice().userInterfaceIdiom == .Pad {
            self.clearsSelectionOnViewWillAppear = false
            self.preferredContentSize = CGSize(width: 320.0, height: 600.0)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let fm = NSFileManager.defaultManager()
        let path = NSBundle.mainBundle().resourcePath! //how does this know it is the content specific folder? Try playing with moving files around e.g. what if not in content/ supporting files
        println(path)
        let items = fm.contentsOfDirectoryAtPath(path, error: nil)
        // be aware of API returning AnyObject datatype and having to explicitly state it as another datatype in loop
        
        for item in items as [String] {
            if item.hasPrefix("nssl") {
                objects.append(item)
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Segues

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showDetail" {
            if let indexPath = self.tableView.indexPathForSelectedRow() {
                let object = objects[indexPath.row]
                let controller = (segue.destinationViewController as UINavigationController).topViewController as DetailViewController
                controller.detailItem = object
                controller.navigationItem.leftBarButtonItem = self.splitViewController?.displayModeButtonItem()
                controller.navigationItem.leftItemsSupplementBackButton = true
//                let detailViewController = segue.destinationViewController as! DetailViewController
//                detailViewController.detailItem = objects[indexPath.row]
            }
        }
    }
    
    //AUTOLAYOUT 2 KEY RULES
    //1. All rules must be complete
    //2. Rules must not be conflicting
    
    // to pin to all sides select all 4 constrains and do not constrain to margins
    
    
    // MARK: - Table View

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return objects.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as UITableViewCell

        cell.textLabel!.text = objects[indexPath.row]
        return cell
    }

}

