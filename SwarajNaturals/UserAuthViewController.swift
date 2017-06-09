//
//  ViewController.swift
//  SwarajNaturals
//
//  Created by Avinash Dodda on 5/22/17.
//  Copyright © 2017 SwarajNaturals. All rights reserved.
//

import UIKit
import FirebaseAuth
import GoogleSignIn

class UserAuthViewController: UIViewController, GIDSignInUIDelegate {
    
    // outlets
    
    @IBOutlet weak var signInBtn: UIButton!
    
    @IBOutlet weak var createAccountBtn: UIButton!
    
    @IBOutlet weak var emailTF: UITextField!
    
    @IBOutlet weak var passwordTF: UITextField!
    
    @IBOutlet weak var reenterPasswordTF: UITextField!
    
    @IBOutlet weak var googleSignInBtn: GIDSignInButton!
    
    var isCreateAccount = false

    override func viewDidLoad() {
        super.viewDidLoad()
        GIDSignIn.sharedInstance().uiDelegate = self
        reenterPasswordTF.isHidden = true
        googleSignInBtn.style = GIDSignInButtonStyle.wide
        googleSignInBtn.colorScheme = GIDSignInButtonColorScheme.light
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.navigationBar.isHidden = false
    }
    

    // btn actions
    @IBAction func signIn(_ sender: Any) {
        self.resignFirstResponder()
        
        if(isCreateAccount){
            Auth.auth().createUser(withEmail: emailTF.text!, password: passwordTF.text!) { (user, error) in
                if let currentUser = user {
                    self.goHome(user : currentUser)
                }            }
        } else {
            Auth.auth().signIn(withEmail: emailTF.text!, password: passwordTF.text!) { (user, error) in
                if let currentUser = user {
                    self.goHome(user : currentUser)
                }
            }
 
        }
    }
    
    
    @IBAction func createAccount(_ sender: Any) {
        reenterPasswordTF.isHidden = false
        signInBtn.setTitle("Create Account", for: UIControlState.normal)
        createAccountBtn.isHidden = true
        isCreateAccount = true
    }
    
    
    // navigating to home tab bar controller
    func goHome(user : User) {
        let homeViewControllerObj = self.storyboard?.instantiateViewController(withIdentifier: "HomeViewControllerIdentifier") as? HomeViewController
        self.navigationController?.pushViewController(homeViewControllerObj!, animated: true)
        
    }
}
