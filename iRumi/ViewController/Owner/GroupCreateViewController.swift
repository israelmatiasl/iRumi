//
//  GroupCreateViewController.swift
//  iRumi
//
//  Created by Israel Matias on 6/26/19.
//  Copyright © 2019 Israel Matias. All rights reserved.
//

import UIKit
import os

class GroupCreateViewController: UIViewController {

    @IBOutlet weak var groupNameTextField: UITextField!
    @IBOutlet weak var participantsTextView: UITextView!
    var token:String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.participantsTextView.layer.borderWidth = 0.2
        
        token = UserDefaults.standard.string(forKey: DefaultKeys.Token) ?? ""
    }
    
    @IBAction func createGroup(_ sender: UIButton) {
        
        var emails:[String] = [String]()
        let allEmails:String = participantsTextView.text ?? ""
        let arrEmails = allEmails.split(separator: "\n")
        
        for email in arrEmails {
            emails.append(String(email.lowercased()))
        }
        
        let groupRequest:GroupRequest = GroupRequest(Name: groupNameTextField.text ?? "",
                                                     Participants: emails)
        GroupApi.SaveGroup(token: token, groupRequest: groupRequest, responseHandler: handleResponse, errorHandler: handleError)
    }
    
    func handleResponse(response: Group) {
        _ = navigationController?.popViewController(animated: true)
    }
    
    func handleError(error: Error) {
        let message = "Error while requesting Groups: \(error.localizedDescription)"
        os_log("%@", message)
    }
    
}
