//
//  SettingsViewController.swift
//  Carousel
//
//  Created by Scott Tong on 2/12/15.
//  Copyright (c) 2015 Scott Tong. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
	@IBOutlet weak var settingScrollView: UIScrollView!
	@IBOutlet weak var settingsImageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()

		settingScrollView.frame.size = CGSize(width: 320, height: 504)
		settingScrollView.contentSize = settingsImageView.frame.size
		
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
	@IBAction func didPressDismissButton(sender: AnyObject) {
		dismissViewControllerAnimated(true, completion: nil)
	}

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
