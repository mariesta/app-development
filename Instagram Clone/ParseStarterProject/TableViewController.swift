//
//  TableViewController.swift
//  ParseStarterProject-Swift
//
//  Created by Marie Starck on 2017-11-12.
//  Copyright © 2017 Parse. All rights reserved.
//

import UIKit
import Parse

class TableViewController: UITableViewController {
    
    var usernames = [""]
    var userids = [""]
    var isFollowing = ["": false]
    
    var refresher: UIRefreshControl!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "logout" {
            PFUser.logOut()
        }
    }


    func refresh() {
       let query = PFUser.query()
        query?.findObjectsInBackground(block: { (objects, error) in
            if let users = objects {
                self.usernames.removeAll(keepingCapacity: true)
                self.userids.removeAll(keepingCapacity: true)
                self.isFollowing.removeAll(keepingCapacity: true)
                for userRow in users {
                    if let user = userRow as? PFUser {
                        if user.objectId != PFUser.current()?.objectId {
                            self.usernames.append(user.username!)
                            self.userids.append(user.objectId!)
                            
                            let queryFollowers = PFQuery(className: "followers")
                            queryFollowers.whereKey("follower", equalTo: PFUser.current()!.objectId!)
                            queryFollowers.whereKey("following", equalTo: user.objectId!)
                            
                            queryFollowers.findObjectsInBackground(block: { (objects, error) in
                                if let followers = objects {
                                    if followers.count > 0 {
                                        self.isFollowing[user.objectId!] = true
                                    } else {
                                        self.isFollowing[user.objectId!] = false
                                    }
                                } else {
                                    self.isFollowing[user.objectId!] = false
                                }
                                
                                if self.isFollowing.count == self.usernames.count {
                                    self.tableView.reloadData()
                                    self.refresher.endRefreshing()
                                }
                            })
                        }
                    }
                }
            }
            
        })
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        refresher = UIRefreshControl()
        refresher.attributedTitle = NSAttributedString(string: "Pull to refresh")
        refresher.addTarget(self, action: #selector(TableViewController.refresh), for: UIControlEvents.valueChanged)
        self.tableView.addSubview(refresher)
        
        refresh()
        
        
        

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return usernames.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

         cell.textLabel?.text = usernames[indexPath.row]
        let followedObjectId = userids[indexPath.row]
        if isFollowing[followedObjectId] == true {
            cell.accessoryType = UITableViewCellAccessoryType.checkmark
        }

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell:UITableViewCell = tableView.cellForRow(at: indexPath)!
        let followedObjectId = userids[indexPath.row]
        if isFollowing[followedObjectId] == false {
            isFollowing[followedObjectId] = true
            
            cell.accessoryType = UITableViewCellAccessoryType.checkmark
            let following = PFObject(className: "followers")
            following["following"] = userids[indexPath.row]
            following["follower"] = PFUser.current()?.objectId
            
            following.saveInBackground()
        } else {
            isFollowing[followedObjectId] = false
            
            cell.accessoryType = UITableViewCellAccessoryType.none
            let queryFollowers = PFQuery(className: "followers")
            queryFollowers.whereKey("follower", equalTo: PFUser.current()!.objectId!)
            queryFollowers.whereKey("following", equalTo: userids[indexPath.row])
            
            queryFollowers.findObjectsInBackground(block: { (objects, error) in
                if let objects = objects {
                    for object in objects {
                        object.deleteInBackground()
                    }
                }
            })
        }
    }


    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
