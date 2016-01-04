//
//  CityTableViewController.swift
//  City Picker
//
//  Created by James Nakano on 12/11/15.
//  Copyright © 2015 ConfuzedSkull. All rights reserved.
//

import UIKit

class CityTableViewController: UITableViewController {
    var state: String!
    var cities = [[String]]()

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Cities"
        //Load city names
        let filePath = NSBundle.mainBundle().pathForResource(state, ofType: "txt")
        let fileData = try? String(contentsOfFile: filePath!, encoding: NSUTF8StringEncoding)
        let fileLines = fileData?.componentsSeparatedByString("\n")
        //Allocate space for each section
        for _ in ALPHABET {
            cities.append([String]())
        }
        //Sort names alphabetically
        for line in fileLines! {
            let firstCharacter = String(line.characters.first!)
            let index = ALPHABET.indexOf(firstCharacter)
            cities[index!].append(line)
        }
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return ALPHABET.count
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cities[section].count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = cities[indexPath.section][indexPath.row]
        cell.userInteractionEnabled = false
        return cell
    }
    
    override func sectionIndexTitlesForTableView(tableView: UITableView) -> [String]? {
        return ALPHABET
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return ALPHABET[section]
    }
}
