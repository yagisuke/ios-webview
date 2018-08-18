//
//  ViewController.swift
//  app
//
//  Created by yagisuke on 2018/08/18.
//  Copyright © 2018 yagisuke. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var urlTextField: UITextField!
    @IBOutlet weak var browserWebView: UIWebView!
    @IBOutlet weak var backButton: UIBarButtonItem!
    @IBOutlet weak var forwardButton: UIBarButtonItem!
    @IBOutlet weak var reloadButton: UIBarButtonItem!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let urlString = "http://dotinstall.com/"
        let urlRequest = URLRequest(url: URL(string: urlString)!)
        self.browserWebView.loadRequest(urlRequest)
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func goBack(_ sender: Any) {
    }

    @IBAction func goForward(_ sender: Any) {
    }

    @IBAction func reload(_ sender: Any) {
    }
}

