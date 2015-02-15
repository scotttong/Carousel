//
//  SignInViewController.swift
//  Carousel
//
//  Created by Scott Tong on 2/10/15.
//  Copyright (c) 2015 Scott Tong. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController, UIAlertViewDelegate {

	@IBOutlet weak var signInTextFieldsContainer: UIView!
	@IBOutlet weak var signInButton: UIView!
	@IBOutlet weak var signInText: UIImageView!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
	@IBOutlet var createTextView: UIView!
	var keyboardIsShowing: Bool! = false

	
	var originalTextFieldsYCenter: CGFloat!
	var originalSignInButtonYCenter: CGFloat!
	
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
		
		NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow:", name: UIKeyboardWillShowNotification, object: nil)
		NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillHide:", name: UIKeyboardWillHideNotification, object: nil)
		
		originalTextFieldsYCenter = signInTextFieldsContainer.center.y
		originalSignInButtonYCenter = signInButton.center.y
		
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

	@IBAction func textFieldEditingChanged(sender: AnyObject) {
		var keyboardIsShowing: Bool! = true

	}
	
	
	@IBAction func disPressSignInButton(sender: AnyObject) {
		self.view.endEditing(true)
		keyboardIsShowing = false
		println("keyboard is hidden")

		
	}
	
	
    @IBAction func backButtonPressed(sender: AnyObject) {
        navigationController?.popViewControllerAnimated(true)
    }


// FORM VALIDATION FOR THE EMAIL AND PASSWORD -->
    @IBAction func didPressSignInButton(sender: AnyObject) {

        if (emailTextField.text == "scott@gmail.com" && passwordTextField.text == "password") {
            var alertView = UIAlertView(title: "Signing in...", message: nil, delegate: nil, cancelButtonTitle: nil)
            alertView.title = "Signing in..."
            alertView.show()
            delay(2, { () -> () in
                    self.performSegueWithIdentifier("signedInSegue", sender: self)
                alertView.dismissWithClickedButtonIndex(0, animated: true)
                })

        }
		else if (emailTextField.text.isEmpty){
            var alertView = UIAlertView(title: "Email required", message: "Hook me up with something legit!", delegate: nil, cancelButtonTitle: "OK")
            alertView.show()
            
        }
		else if (passwordTextField.text.isEmpty) {
            var alertView = UIAlertView(title: "Password required", message: "C'mon dawg.", delegate: nil, cancelButtonTitle: "OK")
            alertView.show()
        }
		else {
            var alertView = UIAlertView (title: "Oops", message: "Email or Password is incorrect", delegate: nil, cancelButtonTitle: "OK")
            alertView.show()
        }
	}
	
	@IBAction func didPressBackButton(sender: AnyObject) {
		
		navigationController!.popViewControllerAnimated(true)
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
			self.signInTextFieldsContainer.center.y = self.signInTextFieldsContainer.center.y - self.signInText.frame.height
			self.signInButton.center.y = self.signInButton.center.y - kbSize.height
			self.keyboardIsShowing = true
			
			}, completion: nil)
		} else {
			self.signInTextFieldsContainer.center.y = self.signInTextFieldsContainer.center.y
			
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
			
				self.signInTextFieldsContainer.center.y = self.originalTextFieldsYCenter
				self.signInButton.center.y = self.originalSignInButtonYCenter
			
			}, completion: nil)
		
	}
	
	
}

