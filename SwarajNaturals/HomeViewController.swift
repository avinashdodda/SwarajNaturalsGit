//
//  HomeViewController.swift
//  SwarajNaturals
//
//  Created by Avinash Dodda on 6/8/17.
//  Copyright © 2017 SwarajNaturals. All rights reserved.
//

import UIKit

class HomeViewController: UITabBarController {
    

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
        self.title = "Swaraj Naturals"
        self.navigationItem.hidesBackButton = true
    }

}
