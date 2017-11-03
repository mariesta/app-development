//
//  DetailViewController.swift
//  Blog Reader
//
//  Created by Marie Starck on 2017-11-03.
//  Copyright © 2017 Marie Starck. All rights reserved.
//

import UIKit
import WebKit

class DetailViewController: UIViewController {

    @IBOutlet weak var webview: WKWebView!
    

    func configureView() {
        // Update the user interface for the detail item.
        if let detail = detailItem {
            if let postWebView = self.webview {
                postWebView.loadHTMLString(detail.value(forKey: "content") as! String, baseURL: URL(string: "http://googleblog.blogspot.co.uk/"))
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        configureView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    var detailItem: AnyObject? {
        didSet {
            // Update the view.
            configureView()
        }
    }


}

