//
//  ViewController.swift
//  Weather Forecast
//
//  Created by Marie Starck on 2017-10-23.
//  Copyright © 2017 Marie Starck. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var cityTextField: UITextField!
    @IBOutlet weak var forecastLabel: UILabel!
    
    @IBAction func getForecast(_ sender: Any) {
        // Get city name entered
        let city = cityTextField.text!

        if (city != "") {
            let urlweather = URL(string: "https://www.weather-forecast.com/locations/\(city)/forecasts/latest")
            do {
                let webContent = try String(contentsOf: urlweather!, encoding: String.Encoding.utf8)
                
                // Get the part of the HTML we are interested about.
                // Day Weather Forecast Summary... preceded the string we want
                let websiteArray = webContent.components(separatedBy: "Day Weather Forecast Summary:</b><span class=\"read-more-small\"><span class=\"read-more-content\"> <span class=\"phrase\">")
                if websiteArray.count > 1 {

                    // WebsiteArray[1] starts with the weather forecast and we only want the part up to </span>
                    let weatherArray = websiteArray[1].components(separatedBy: "</span>")
                    if weatherArray.count > 0 {
                        forecastLabel.textColor = UIColor.black
                        forecastLabel.text = weatherArray[0].replacingOccurrences(of: "&deg;", with: "º")
                    }
                } else {
                    forecastLabel.textColor = UIColor.red
                    forecastLabel.text = "There was an error. Please check your city name and try again."
                }
            } catch let error {
                forecastLabel.textColor = UIColor.red
                forecastLabel.text = "There was an error. Please check your city name and try again."
                print("Error: \(error)")
            }
            
        }
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
    
    func textFieldShouldReturn(textfield: UITextField!) -> Bool {
        cityTextField.resignFirstResponder()
        return true
    }
    

}

