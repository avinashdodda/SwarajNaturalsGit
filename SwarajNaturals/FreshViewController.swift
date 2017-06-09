//
//  FreshViewController.swift
//  SwarajNaturals
//
//  Created by Avinash Dodda on 6/8/17.
//  Copyright © 2017 SwarajNaturals. All rights reserved.
//

import UIKit
import FirebaseAuth

class FreshViewController: UIViewController {

    
    @IBAction func signOut(_ sender: Any) {
        
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
            goHome()
        } catch let signOutError as NSError {
            print ("Error signing out: %@", signOutError)
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
//        self.tabBarController?.navigationItem.title = "Fresh off the Farm"
//        self.tabBarController?.navigationItem.hidesBackButton = true
    }
    
    func goHome() {
//        let homeViewControllerObj = self.storyboard?.instantiateViewController(withIdentifier: "UserAuthViewControllerIdentifier") as? HomeViewController
//        self.navigationController?.pushViewController(homeViewControllerObj!, animated: true)
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
