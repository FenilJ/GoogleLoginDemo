//  ViewController.swift
//  GoogleLoginDemo
//
//  Created by A.Live Mind on 13/07/18.
//  Copyright © 2018 A.Live Mind. All rights reserved.

import UIKit
import GoogleSignIn



class ViewController: UIViewController, GIDSignInDelegate, GIDSignInUIDelegate{

    override func viewDidLoad() {
        super.viewDidLoad()
      
        GIDSignIn.sharedInstance().clientID = "827731290623-9gfcvn1b8ra9emomqv8u965pa4qchq8j.apps.googleusercontent.com"
        GIDSignIn.sharedInstance().delegate = self
        GIDSignIn.sharedInstance().uiDelegate = self
        
//        NSURL *authorizationEndpoint =
//            [NSURL URLWithString:@"https://accounts.google.com/o/oauth2/v2/auth"];
//        NSURL *tokenEndpoint =
//            [NSURL URLWithString:@"https://www.googleapis.com/oauth2/v4/token"];
//        
//        OIDServiceConfiguration *configuration =
//            [[OIDServiceConfiguration alloc]
//                initWithAuthorizationEndpoint:authorizationEndpoint
//                tokenEndpoint:tokenEndpoint];

        
    }
    
    
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!,
              withError error: Error!) {
        if let error = error {
            print("\(error.localizedDescription)")
        } else {
            let userId = user.userID
            let fullName = user.profile.name
            let givenName = user.profile.givenName
            let email = user.profile.email
            
            print("UserID: \(String(describing: userId))")
            print("Full Name:\(String(describing: fullName))")
            print("Given Name:\(String(describing: givenName))")
            print("Email:\(String(describing: email))")
            
            let nextVC = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "ViewController1") as! ViewController1
            
            
            self.navigationController?.pushViewController(nextVC, animated: true)
        }
    }
    func sign(_ signIn: GIDSignIn!, didDisconnectWith user: GIDGoogleUser!, withError error: Error!) {
        
    }
    
}

