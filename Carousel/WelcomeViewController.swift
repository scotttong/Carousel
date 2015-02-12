//
//  WelcomeViewController.swift
//  Carousel
//
//  Created by Scott Tong on 2/12/15.
//  Copyright (c) 2015 Scott Tong. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController, UIScrollViewDelegate {

	@IBOutlet weak var modalButton: UIButton!
	@IBOutlet weak var spinButton: UIImageView!
	@IBOutlet weak var welcomeScrollView: UIScrollView!
	@IBOutlet weak var pageControl: UIPageControl!
	
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
		welcomeScrollView.frame.size = CGSize(width: 320, height: 568)
		welcomeScrollView.contentSize = CGSize(width: 1280, height: 568)
		
		welcomeScrollView.delegate = self
		
		spinButton.alpha = 0
		modalButton.hidden = true
		
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
	
	func scrollViewDidScroll(scrollView: UIScrollView!) {
		// Get the current page based on the scroll offset
		var page : Int = Int(round(scrollView.contentOffset.x / 320))
//		println("\(scrollView.contentOffset.x/320)")
		// Set the current page, so the dots will update
		pageControl.currentPage = page
		
		if (page == 3) {
			UIView.animateWithDuration(0.25, animations: {
//				self.spinButton.center.y = (self.spinButton.center.y - 20);
				self.spinButton.alpha = 1
				self.modalButton.hidden = false
			})
			
		} else {
			UIView.animateWithDuration(0.25, animations: {
				//				self.spinButton.center.y = (self.spinButton.center.y - 20);
				self.spinButton.alpha = 0
				self.modalButton.hidden = true
			})		}
	
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
