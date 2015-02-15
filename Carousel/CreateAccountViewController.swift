//
//  CreateAccountViewController.swift
//  Carousel
//
//  Created by Scott Tong on 2/12/15.
//  Copyright (c) 2015 Scott Tong. All rights reserved.
//

import UIKit

class CreateAccountViewController: UIViewController {
	
	@IBOutlet weak var checkBox: UIButton!
	@IBOutlet weak var createButtonHotspot: UIButton!
	@IBOutlet weak var textFieldContainer: UIView!
	@IBOutlet weak var createText: UIImageView!
	@IBOutlet weak var createButton: UIImageView!
	
	var originalTextFieldContainerCenter : CGFloat!
	
    override func viewDidLoad() {
        super.viewDidLoad()
	
        // Do any additional setup after loading the view.

		originalTextFieldContainerCenter = textFieldContainer.center.y
		
		NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow:", name: UIKeyboardWillShowNotification, object: nil)
		NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillHide:", name: UIKeyboardWillHideNotification, object: nil)
		
		
	
    }
	
	

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
	@IBAction func didPressBackButton(sender: AnyObject) {
		navigationController!.popViewControllerAnimated(true)
	}

	func keyboardWillHide(notification: NSNotification!) {
		var userInfo = notification.userInfo!
		
		// Get the keyboard height and width from the notification
		// Size varies depending on OS, language, orientation
		var kbSize = (userInfo[UIKeyboardFrameEndUserInfoKey] as NSValue).CGRectValue().size
		var durationValue = userInfo[UIKeyboardAnimationDurationUserInfoKey] as NSNumber
		var animationDuration = durationValue.doubleValue
		var curveValue = userInfo[UIKeyboardAnimationCurveUserInfoKey] as NSNumber
		var animationCurve = curveValue.integerValue
		
		UIView.animateWithDuration(animationDuration, delay: 0.0, options: UIViewAnimationOptions(UInt(animationCurve << 16)), animations: {
			
			// Set view properties in here that you want to match with the animation of the keyboard
			// If you need it, you can use the kbSize property above to get the keyboard width and height.
			
			}, completion: nil)
	}
	
	func keyboardWillShow(notification: NSNotification!) {
		var userInfo = notification.userInfo!
		
		// Get the keyboard height and width from the notification
		// Size varies depending on OS, language, orientation
		var kbSize = (userInfo[UIKeyboardFrameEndUserInfoKey] as NSValue).CGRectValue().size
		var durationValue = userInfo[UIKeyboardAnimationDurationUserInfoKey] as NSNumber
		var animationDuration = durationValue.doubleValue
		var curveValue = userInfo[UIKeyboardAnimationCurveUserInfoKey] as NSNumber
		var animationCurve = curveValue.integerValue
		
		
		
		if self.textFieldContainer.frame.maxY >= 64 {
		
		UIView.animateWithDuration(animationDuration, delay: 0.0, options: UIViewAnimationOptions(UInt(animationCurve << 16)), animations: {
			
			// Set view properties in here that you want to match with the animation of the keyboard
			// If you need it, you can use the kbSize property above to get the keyboard width and height.
//			println("hi")
			
			self.textFieldContainer.center.y = self.textFieldContainer.center.y - self.createText.frame.height
			self.createButton.center.y = self.createButton.center.y - kbSize.height
			self.createButtonHotspot.center.y = self.createButtonHotspot.center.y - kbSize.height
			
			
			}, completion: nil)
		}
		
	}
	
	@IBAction func didPressCreateButton(sender: AnyObject) {
		println("create button pressed")
	}
	
	@IBAction func didPressCheckBox(sender: AnyObject) {
		println("check box pressed")
		if let button: UIButton = sender as? UIButton {
			if button.selected {
				button.selected = false
			} else {
				button.selected = true
			}
		}
	
		
	}
	
//	let image = UIImage(named: "play.png") as UIImage!
//	let playButton  = UIButton.buttonWithType(UIButtonType.System) as UIButton
//	playButton.setImage(image, forState: .Normal)

	
	
	
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
