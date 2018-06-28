//
//  LoginViewController.swift
//  BTChat
//
//  Created by Mac on 25.06.18.
//  Copyright © 2018 VasylFuchenko. All rights reserved.
//

import UIKit
import FBSDKLoginKit

class LoginViewController: UIViewController {
    

    @IBOutlet weak var BTChatFon: UIView!
    @IBOutlet weak var singinFon: UIView!
    @IBOutlet weak var facebookButtonContainer: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        singinFon.layer.cornerRadius = 15
        BTChatFon.layer.cornerRadius = 15
        
        //create facebook button
        let buttonFBLogin = FBSDKLoginButton()
        buttonFBLogin.delegate = self
        buttonFBLogin.readPermissions = ["public_profile", "email"]
        buttonFBLogin.frame = facebookButtonContainer.bounds
        facebookButtonContainer.addSubview(buttonFBLogin)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if FBSDKAccessToken.current() != nil {
            performSegue(withIdentifier: "goToChatSegue", sender: nil)
        }
    }
}

    extension LoginViewController: FBSDKLoginButtonDelegate {
        
        func loginButton(_ loginButton: FBSDKLoginButton!, didCompleteWith result: FBSDKLoginManagerLoginResult!, error: Error!) {
            if !result.isCancelled {
            }
        }
        
        func loginButtonDidLogOut(_ loginButton: FBSDKLoginButton!) {
        }
        
        func loginButtonWillLogin(_ loginButton: FBSDKLoginButton!) -> Bool {
            return true
        }
        
    }


