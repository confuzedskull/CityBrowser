//
//  StateTableViewController.swift
//  City Picker
//
//  Created by James Nakano on 12/11/15.
//  Copyright © 2015 ConfuzedSkull. All rights reserved.
//

import UIKit

class StateTableViewController: UITableViewController {

    var states: [String]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "States"
        //Load state names
        let filePath = NSBundle.mainBundle().pathForResource("States", ofType: "txt")
        let fileData = try? String(contentsOfFile: filePath!, encoding: NSUTF8StringEncoding)
        states = fileData?.componentsSeparatedByString("\n")
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 50
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = states[indexPath.row]
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let citiesView = CityTableViewController()
        citiesView.state = states[indexPath.row]
        showViewController(citiesView, sender: self)
    }
}
