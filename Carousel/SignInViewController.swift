//
//  SignInViewController.swift
//  Carousel
//
//  Created by Scott Tong on 2/10/15.
//  Copyright (c) 2015 Scott Tong. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController, UIAlertViewDelegate {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
	@IBOutlet var createTextView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
    @IBAction func backButtonPressed(sender: AnyObject) {
        navigationController!.popViewControllerAnimated(true)
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
}

