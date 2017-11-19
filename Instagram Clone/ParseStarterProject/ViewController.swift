/**
* Copyright (c) 2015-present, Parse, LLC.
* All rights reserved.
*
* This source code is licensed under the BSD-style license found in the
* LICENSE file in the root directory of this source tree. An additional grant
* of patent rights can be found in the PATENTS file in the same directory.
*/

import UIKit
import Parse

class ViewController: UIViewController {
    
    var signupActive = true
    
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    
    @IBOutlet weak var signupButton: UIButton!
    @IBOutlet weak var registeredText: UILabel!
    @IBOutlet weak var loginButton: UIButton!

    var activityIndicator:UIActivityIndicatorView = UIActivityIndicatorView()
    
    
    func displayAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: { (action) in
            self.dismiss(animated: true, completion:nil)
        }))
        
        self.present(alert, animated: true, completion: nil)
    }

    @IBAction func signUp(_ sender: UIButton) {
        if username.text == "" || password.text == ""{
            displayAlert(title: "Error in form", message: "Please enter a username and password")
        } else {
            activityIndicator = UIActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
            activityIndicator.center = self.view.center
            activityIndicator.hidesWhenStopped = true
            activityIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.gray
            view.addSubview(activityIndicator)
            activityIndicator.startAnimating()
            UIApplication.shared.beginIgnoringInteractionEvents()
            
            var errorMessage = "Please try again later"
            
            if signupActive == true {
                let user = PFUser()
                user.username = username.text
                user.password = password.text
                
                
                
                user.signUpInBackground(block: { (success, error) in
                    self.activityIndicator.stopAnimating()
                    UIApplication.shared.endIgnoringInteractionEvents()
                    
                    if error == nil {
                        // Sign up successful
                        self.performSegue(withIdentifier: "login", sender: self)
                    } else {
                        errorMessage = (error?.localizedDescription)!
                        self.displayAlert(title: "Failed sign up", message: errorMessage)
                    }
                })
            } else {
                PFUser.logInWithUsername(inBackground: username.text!, password: password.text!, block: { (user, error) in
                    self.activityIndicator.stopAnimating()
                    UIApplication.shared.endIgnoringInteractionEvents()
                    
                    if user != nil {
                        // Login successful
                        self.performSegue(withIdentifier: "login", sender: self)
                    } else {
                        errorMessage = (error?.localizedDescription)!
                        self.displayAlert(title: "Failed login", message: errorMessage)
                    }
                })
            }
        }
    }
    
    @IBAction func login(_ sender: UIButton) {
        
        if signupActive == true {
            signupButton.setTitle("Login", for: UIControlState.normal)
            registeredText.text = "Need an account?"
            loginButton.setTitle("Sign Up", for: UIControlState.normal)
            signupActive = false
        } else {
            signupButton.setTitle("Sign Up", for: UIControlState.normal)
            registeredText.text = "Already registered?"
            loginButton.setTitle("Login", for: UIControlState.normal)
            signupActive = true
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationItem.setHidesBackButton(true, animated: false)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if PFUser.current()!.objectId != nil {
            self.performSegue(withIdentifier: "login", sender: self)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
