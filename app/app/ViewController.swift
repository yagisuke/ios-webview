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
        
        let urlString = ""
        self.loadUrl(urlString: urlString)
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func showAlert(_ message: String) {
        let alertController = UIAlertController(title: "ERROR", message: message, preferredStyle: .alert)
        let defaultAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(defaultAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    func getValidatedUrl(urlString: String) -> URL? {
        if URL(string: urlString) == nil {
            self.showAlert("Invalid Alert")
            return nil
        }
        return URL(string: urlString)
    }

    func loadUrl(urlString: String) {
        if let url = self.getValidatedUrl(urlString: urlString) {
            let urlRequest = URLRequest(url: url)
            self.browserWebView.loadRequest(urlRequest)
        }
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

