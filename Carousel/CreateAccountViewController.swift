//
//  CreateAccountViewController.swift
//  Carousel
//
//  Created by Scott Tong on 2/14/15.
//  Copyright (c) 2015 Scott Tong. All rights reserved.
//

import UIKit

class CreateAccountViewController: UIViewController {

	@IBOutlet weak var passwordTextField: UITextField!
	@IBOutlet weak var lastNameTextField: UITextField!
	@IBOutlet weak var firstNameTextField: UITextField!
	@IBOutlet weak var emailTextField: UITextField!
	@IBOutlet weak var createText: UIImageView!
	@IBOutlet weak var checkBox: UIButton!
	@IBOutlet weak var textFieldContainer: UIView!
	@IBOutlet weak var createButton: UIButton!
	
	var originalTextFieldCenterY: CGFloat!
	var originalButtonCenterY: CGFloat!
	var keyboardIsShowing: Bool! = false
	
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
		
		NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow:", name: UIKeyboardWillShowNotification, object: nil)
		NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillHide:", name: UIKeyboardWillHideNotification, object: nil)
	
		originalTextFieldCenterY =  textFieldContainer.center.y
		originalButtonCenterY = createButton.center.y
		
		
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
	@IBAction func textEditingChanged(sender: AnyObject) {
		keyboardIsShowing = true
	}
    
	@IBAction func backButton(sender: AnyObject) {
		navigationController!.popViewControllerAnimated(true)
	}
	
	@IBAction func didPressCreateButton(sender: AnyObject) {
		println("create button pressed")
		self.view.endEditing(true)
		keyboardIsShowing = false
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
		
		if keyboardIsShowing == false {
			//move the login up just a little since the keyboard didn't overlap the view
			UIView.animateWithDuration(animationDuration, delay: 0.0, options: UIViewAnimationOptions(UInt(animationCurve << 16)), animations: {
				
				
				println("keyboard showing")
				self.textFieldContainer.center.y = self.textFieldContainer.center.y - self.createText.frame.height
				self.createButton.center.y = self.createButton.center.y - kbSize.height
				self.keyboardIsShowing = true
				}, completion: nil)
			
		} else {
			self.textFieldContainer.center.y = self.originalTextFieldCenterY
			self.createButton.center.y = self.originalButtonCenterY
		}
		
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
			
			self.textFieldContainer.center.y = self.originalTextFieldCenterY
			self.createButton.center.y = self.originalButtonCenterY
			
			}, completion: nil)
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
