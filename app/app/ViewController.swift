//
//  ViewController.swift
//  app
//
//  Created by yagisuke on 2018/08/18.
//  Copyright © 2018 yagisuke. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIWebViewDelegate, UITextFieldDelegate {

    @IBOutlet weak var urlTextField: UITextField!
    @IBOutlet weak var browserWebView: UIWebView!
    @IBOutlet weak var backButton: UIBarButtonItem!
    @IBOutlet weak var forwardButton: UIBarButtonItem!
    @IBOutlet weak var reloadButton: UIBarButtonItem!
    @IBOutlet weak var browserActivityIndicator: UIActivityIndicatorView!
    
    func webViewDidStartLoad(_ webView: UIWebView) {
        self.browserActivityIndicator.startAnimating()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.browserWebView.delegate = self
        self.urlTextField.delegate = self
        self.browserActivityIndicator.hidesWhenStopped = true

        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField != self.urlTextField {
            return true
        }
        if let urlString = textField.text {
            self.loadUrl(urlString: urlString)
        }
        return true
    }
    
    func webViewDidFinishLoad(_ webView: UIWebView) {
        if let urlString = self.browserWebView.request?.url?.absoluteString {
            self.urlTextField.text = urlString
        }
        self.browserActivityIndicator.stopAnimating()
        self.backButton.isEnabled = self.browserWebView.canGoBack
        self.forwardButton.isEnabled = self.browserWebView.canGoForward
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        let urlString = "http://dotinstall.com"
        self.loadUrl(urlString: urlString)
        self.addBorder()
    }
    
    func addBorder() {
        let topBorder = CALayer()
        topBorder.frame = CGRect(x: 0.0, y: 0.0, width: self.browserWebView.frame.size.width, height: 1.0)
        topBorder.backgroundColor = UIColor.lightGray.cgColor
        self.browserWebView.layer.addSublayer(topBorder)
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
        self.browserWebView.goBack()
    }

    @IBAction func goForward(_ sender: Any) {
        self.browserWebView.goForward()
    }

    @IBAction func reload(_ sender: Any) {
        self.browserWebView.reload()
    }
}

