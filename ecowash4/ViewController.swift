//
//  ViewController.swift
//  ecowash4
//
//  Created by chinelo mail on 8/19/16.
//  Copyright © 2016 chinelo mail. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIWebViewDelegate {

    @IBOutlet var ActInd: UIActivityIndicatorView!
    @IBOutlet var WebView: UIWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.WebView.delegate = self
        ActInd.hidden = true
        // Do any additional setup after loading the view, typically from a nib.
        let url = NSURL(string: "http://www.theecowash.com")
        WebView.loadRequest(NSURLRequest(URL: url!))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func webView(webView: UIWebView, shouldStartLoadWithRequest request: NSURLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        if navigationType == UIWebViewNavigationType.LinkClicked {
            let application = UIApplication.sharedApplication()
            if let phoneURL = request.URL where (phoneURL.absoluteString.rangeOfString("tel:") != nil) {
                if application.canOpenURL(phoneURL) {
                    application.openURL(phoneURL)
                    return false
                }
            }
        } 
        return true
    }
    
    func webViewDidStartLoad(webView: UIWebView)
    {
        // here show your indicator
        ActInd.hidden = false
        ActInd.startAnimating()
        
    }
    func webViewDidFinishLoad(webView: UIWebView)
    {
        // here hide it
        ActInd.hidden = true
        ActInd.startAnimating()
        
    }
    func webView(webView: UIWebView, didFailLoadWithError error: NSError?)
    {
        ActInd.hidden = true
        print("Please reload page")
        
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
}