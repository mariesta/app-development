//
//  FirstViewController.swift
//  To Do List
//
//  Created by Marie Starck on 2017-10-23.
//  Copyright © 2017 Marie Starck. All rights reserved.
//

import UIKit

var toDoListItems = [String]()

class FirstViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var toDoListTable: UITableView!
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toDoListItems.count
    }

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "Cell")
        cell.textLabel?.text = toDoListItems[indexPath.row]
        
        return cell
    }
    
    public func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCellEditingStyle.delete {
            toDoListItems.remove(at: indexPath.row)
            UserDefaults.standard.set(toDoListItems, forKey: "toDoList")
            toDoListTable.reloadData()
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        toDoListTable.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if UserDefaults.standard.object(forKey: "toDoList") != nil {
            toDoListItems = UserDefaults.standard.object(forKey: "toDoList") as! [String]
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

