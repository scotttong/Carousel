//
//  TermsViewController.swift
//  Carousel
//
//  Created by Scott Tong on 2/13/15.
//  Copyright (c) 2015 Scott Tong. All rights reserved.
//

import UIKit

class TermsViewController: UIViewController {
	
	@IBOutlet weak var termsWebView: UIWebView!
	
	var URLPath = "https://www.dropbox.com/terms?mobile=1"
	

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

		loadAddressURL()
		
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
	
	func loadAddressURL() {
		let requestURL = NSURL (string: URLPath)
		let request = NSURLRequest(URL: requestURL!)
		termsWebView.loadRequest(request)
	}

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
	@IBAction func didPressDoneButton(sender: AnyObject) {
		dismissViewControllerAnimated(true, completion: nil)
	}

}
