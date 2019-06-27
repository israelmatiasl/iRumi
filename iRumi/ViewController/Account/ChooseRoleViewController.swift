//
//  ChooseRoleViewController.swift
//  iRumi
//
//  Created by Israel Matias on 6/26/19.
//  Copyright © 2019 Israel Matias. All rights reserved.
//

import UIKit

class ChooseRoleViewController: UIViewController {
    
    var role:String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func selectRoomer(_ sender: UIButton) {
        role = "ROOMER"
        performSegue(withIdentifier: "toSignUp", sender: self)
    }
    
    @IBAction func selectOwner(_ sender: UIButton) {
        role = "OWNER"
        performSegue(withIdentifier: "toSignUp", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let signUp = segue.destination as? SignUpViewController else { return }
        signUp.role = self.role
    }
}
