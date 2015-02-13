//
//  TimelineViewController.swift
//  Carousel
//
//  Created by Scott Tong on 2/12/15.
//  Copyright (c) 2015 Scott Tong. All rights reserved.
//

import UIKit

class TimelineViewController: UIViewController {

	@IBOutlet weak var timelineScrollView: UIScrollView!
	@IBOutlet weak var timelineImageView: UIImageView!
	
    override func viewDidLoad() {
        super.viewDidLoad()
		
		timelineScrollView.frame.size = CGSize(width: 320, height: 503)
		timelineScrollView.contentSize = timelineImageView.frame.size
	
		
		
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
