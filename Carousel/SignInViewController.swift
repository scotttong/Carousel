//
//  SignInViewController.swift
//  Carousel
//
//  Created by Scott Tong on 2/10/15.
//  Copyright (c) 2015 Scott Tong. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController {

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


    
    
    
    @IBAction func didPressSignInButton(sender: AnyObject) {

        if (emailTextField.text == "scott@gmail.com" && passwordTextField.text == "password") {
            var delayView = UIAlertView()
            delayView.title = "Signing in..."
            delayView.show()
            delay(2, { () -> () in
                    self.performSegueWithIdentifier("signedInSegue", sender: self)
                delayView.dismissWithClickedButtonIndex(0, animated: true)
                })

        }
        
        else {
            var alertView = UIAlertView (title: "Oops", message: "Email or Password is incorrect", delegate: nil, cancelButtonTitle: "OK")
            alertView.show()
        }
    }
}

