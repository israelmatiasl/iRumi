//
//  SignUpViewController.swift
//  iRumi
//
//  Created by Israel Matias on 6/26/19.
//  Copyright © 2019 Israel Matias. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {

    var role:String = ""
    
    @IBOutlet weak var nameTextFiled: UITextField!
    @IBOutlet weak var surnameTextField: UITextField!
    @IBOutlet weak var genderTextField: GenericPicker!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        genderTextField.dataArray = ["FEMENINO","MASCULINO"]
        genderTextField.titlesArray = ["FEMENINO","MASCULINO"]
        genderTextField.pickerTag = 1
        genderTextField.selectedIndex = 0
        genderTextField.genericPickerDelegate = self
        genderTextField.tintColor = .clear
    }

    @IBAction func upPicker(_ sender: UIButton) {
        genderTextField.initPicker()
        genderTextField.becomeFirstResponder()
    }
}

extension SignUpViewController: GenericPickerDelegate {
    
    func selectRow(tag: Int) {
    }
}
