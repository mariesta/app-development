//
//  SecondViewController.swift
//  To Do List
//
//  Created by Marie Starck on 2017-10-23.
//  Copyright © 2017 Marie Starck. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var item: UITextField!
    @IBAction func addItem(_ sender: Any) {
        toDoListItems.append(item.text!)
        item.text = ""
        
        UserDefaults.standard.set(toDoListItems, forKey: "toDoList")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(textField: UITextField!) -> Bool {
        item.resignFirstResponder()
        return true
    }


}

