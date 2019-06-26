//
//  ViewController.swift
//  iRumi
//
//  Created by Israel Matias on 6/23/19.
//  Copyright © 2019 Israel Matias. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //addImageInputs()
    }

    func addImageInputs(){
        let emailImage = UIImage(named:"mail")
        addLeftImageTo(txtField: emailTextField, andImage: emailImage!)
        
        let passwordImage = UIImage(named:"password")
        addLeftImageTo(txtField: passwordTextField, andImage: passwordImage!)
    }
    
    func addCloseKeyBoard(){
        //let toolBar = UIToolbar()
        //let doneButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem., target: self, action: #selector(self.doneClicked))
    }
    
    func doneClicked(){
        view.endEditing(true)
    }

    func addLeftImageTo(txtField: UITextField, andImage img: UIImage) {
        let leftImageView = UIImageView(frame: CGRect(x: 0.0, y: 0.0, width: img.size.width, height: img.size.height))
        leftImageView.image = img
        txtField.leftView = leftImageView
        txtField.leftViewMode = .always
    }
}

