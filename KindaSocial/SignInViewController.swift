//
//  SignInViewController.swift
//  KindaSocial
//
//  Created by Sarthak Kapoor on 13/07/17.
//  Copyright © 2017 SK21. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FBSDKLoginKit
import FacebookLogin
import FacebookCore

class SignInViewController: UIViewController, FBSDKLoginButtonDelegate, GIDSignInUIDelegate {
    
    var handle: AuthStateDidChangeListenerHandle?
    
    @IBOutlet weak var emailField: EmailPassSignIn!
    
    @IBOutlet weak var passwordField: EmailPassSignIn!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let loginButton = FBSDKLoginButton()
        loginButton.delegate = self
        
        GIDSignIn.sharedInstance().uiDelegate = self
        
        GIDSignIn.sharedInstance().signInSilently()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
//        if let accessToken = AccessToken.current {
//            
//            print("\n\n\n\n\n\n\n")
//            print("HAHA")
//            print("\n\n\n\n\n\n\n")
//        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        handle = Auth.auth().addStateDidChangeListener { (auth, user) in
            
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        
        Auth.auth().removeStateDidChangeListener(handle!)
    }
    
    
    
    public func loginButtonDidLogOut(_ loginButton: FBSDKLoginButton!) {
        
    }
    
    func loginButton(_ loginButton: FBSDKLoginButton!, didCompleteWith result: FBSDKLoginManagerLoginResult!, error: Error?) {
        
        print("\n\n\n\n\n\n\n")
        print("NOOOOOO")
        print("\n\n\n\n\n\n\n")
        
        if let error = error {
            print(error.localizedDescription)
            return
            
        } else {
            
            let credential = FacebookAuthProvider.credential(withAccessToken: FBSDKAccessToken.current().tokenString)
            
            Auth.auth().signIn(with: credential) { (user, error) in
                if let error = error {
                    
                    print(error)
                    return
                } else {
                    
                    print("Authenticated with firebase")
                }
            }
        }

    }

    @IBAction func signInButtonClicked(_ sender: UIButton) {
        
        if emailField.text != "" && passwordField.text != "" {
            
            if let email = emailField.text , let password = passwordField.text {
                
                Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
                    
                    if error != nil {
                        
                        print("SIGN IN \(error?.localizedDescription)")
                        
                        Auth.auth().createUser(withEmail: email, password: password) { (user, error) in
                            
                            if error != nil {
                                
                                print("SIGN UP \(error?.localizedDescription)")
                            } else {
                                
                                print("User Created Successfully")
                            }
                        }
                        
                    } else {
                        
                        print("User Signed In Successfully")
                    }
                }
            }
        } else {
            
            print("Email Password Empty")
        }
    }
    
    @IBAction func facebookSignInButtonClicked(_ sender: Any) {
        
        let loginManager = LoginManager()
        loginManager.logIn([ ReadPermission.email ], viewController: self) { loginResult in
            switch loginResult {
            case .failed(let error):
                print(error)
            case .cancelled:
                print("User cancelled login.")
            case .success(let grantedPermissions, let declinedPermissions, let accessToken):
                print("Logged in!")
                
                let credential = FacebookAuthProvider.credential(withAccessToken: FBSDKAccessToken.current().tokenString)
                
                Auth.auth().signIn(with: credential) { (user, error) in
                    if let error = error {
                        
                        print(error)
                        return
                    } else {
                        
                        print("Authenticated with firebase")
                    }
                }
            }
        }
    }
    
}

