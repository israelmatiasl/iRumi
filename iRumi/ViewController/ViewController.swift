//
//  ViewController.swift
//  iRumi
//
//  Created by Israel Matias on 6/23/19.
//  Copyright © 2019 Israel Matias. All rights reserved.
//

import UIKit
import os

class ViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        addImageInputs()
    }

    func addImageInputs(){
        let emailImage = UIImage(named:"mail")
        addLeftImageTo(txtField: emailTextField, andImage: emailImage!)
        
        let passwordImage = UIImage(named:"password")
        addLeftImageTo(txtField: passwordTextField, andImage: passwordImage!)
    }

    @IBAction func signIn(_ sender: UIButton) {
        let loginRequest = LoginRequest(
            email: emailTextField.text ?? "israelmatiasl@gmail.com",
            password: passwordTextField.text ?? "12345678"
        )
        
        AccountApi.signIn(loginRequest: loginRequest, responseHandler: handleResponse, errorHandler: handleError)
    }
    
    func handleResponse(response: LoginResponse) {
        
        let defaults = UserDefaults.standard
        defaults.set(response.token, forKey: DefaultKeys.Token)
        
        if (response.role == "ROOMER") {
            let storyBoard : UIStoryboard = UIStoryboard(name: "Roomer", bundle:nil)
            let nextViewController = storyBoard.instantiateViewController(withIdentifier: "TabBarRoomerViewController") as! TabBarRoomerViewController
            self.present(nextViewController, animated:true, completion:nil)
        }
        else {
            let storyBoard : UIStoryboard = UIStoryboard(name: "Owner", bundle:nil)
            let nextViewController = storyBoard.instantiateViewController(withIdentifier: "TabBarOwnerViewController") as! TabBarOwnerViewController
            self.present(nextViewController, animated:true, completion:nil)
        }
        
    }
    
    func handleError(error: Error) {
        let message = "Error while requesting SignIn: \(error.localizedDescription)"
        os_log("%@", message)
        //showToast(message: "Ha ocurrido un error")
    }
    
    
    func addLeftImageTo(txtField: UITextField, andImage img: UIImage) {
        let leftImageView = UIImageView(frame: CGRect(x: 0.0, y: 0.0, width: img.size.width, height: img.size.height))
        leftImageView.image = img
        txtField.leftView = leftImageView
        txtField.leftViewMode = .always
    }
}

