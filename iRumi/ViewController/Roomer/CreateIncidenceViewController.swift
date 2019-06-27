//
//  CreateIncidenceViewController.swift
//  iRumi
//
//  Created by Israel Matias on 6/27/19.
//  Copyright © 2019 Israel Matias. All rights reserved.
//

import UIKit
import os

class CreateIncidenceViewController: UIViewController {

    @IBOutlet weak var titleText: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func saveIncidence(_ sender: Any) {
        guard let title = titleText.text
        else {return}
        
        IncidenceApi.CreateIncidence(
            incidenceRequest: IncidenceRequest(groupId: "hola", description: title),
            responseHandler: handleResponse,
            errorHandler: handleError)
    }
    
    func handleResponse(incidente: Incidence?){
        
    }
    
    
    func handleError(error:Error){
        
        let message = "Error on Organizer Request:  \(error.localizedDescription)"
        
        os_log("%@",message)
        
    }

}
