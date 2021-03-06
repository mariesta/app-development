//
//  FeedTableViewController.swift
//  ParseStarterProject-Swift
//
//  Created by Marie Starck on 2017-11-13.
//  Copyright © 2017 Parse. All rights reserved.
//

import UIKit
import Parse

class FeedTableViewController: UITableViewController {
    
    var captions = [String]()
    var usernames = [String]()
    var imagesFiles = [PFFile]()
    var users = [String: String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        let query = PFUser.query()
        query?.findObjectsInBackground(block: { (objects, error) in
            if let users = objects {
                self.usernames.removeAll(keepingCapacity: true)
                self.captions.removeAll(keepingCapacity: true)
                self.imagesFiles.removeAll(keepingCapacity: true)
                self.users.removeAll(keepingCapacity: true)
                for userRow in users {
                    if let user = userRow as? PFUser {
                        self.users[user.objectId!] = user.username!
                    }
                }
            }
            let getFollowedUsersQuery = PFQuery(className: "followers")
            getFollowedUsersQuery.whereKey("follower", equalTo: PFUser.current()!.objectId!)
            getFollowedUsersQuery.findObjectsInBackground { (objects, error) in
                if let objects = objects {
                    for object in objects {
                        let followedUser  = object["following"] as! String
                        
                        let query = PFQuery(className: "Image")
                        query.whereKey("userId", equalTo: followedUser)
                        query.findObjectsInBackground(block: { (images, error) in
                            if let images = images {
                                for image in images {
                                    self.captions.append(image["caption"] as! String)
                                    self.imagesFiles.append(image["imageFile"] as! PFFile)
                                    self.usernames.append(self.users[image["userId"] as! String]!)
                                    
                                    self.tableView.reloadData()
                                    
                                }
                            }
                        })
                    }
                }
            }
        })
       
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
        let sampleCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! Cell
        
        imagesFiles[indexPath.row].getDataInBackground { (data, error) in
            if let downloadedimage = UIImage(data: data!) {
                sampleCell.postedImage.image = downloadedimage
            }
        }
        
        
        sampleCell.username.text = usernames[indexPath.row]
        sampleCell.caption.text = captions[indexPath.row]

        return sampleCell
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
