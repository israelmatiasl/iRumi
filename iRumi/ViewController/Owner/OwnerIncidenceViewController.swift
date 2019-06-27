//
//  OwnerIncidenceViewController.swift
//  iRumi
//
//  Created by Israel Matias on 6/27/19.
//  Copyright © 2019 Israel Matias. All rights reserved.
//

import UIKit
import os

class OwnerIncidenceViewController: UIViewController {
    
    var incidence: Incidence?
    var isCheck = false
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var descriptionText: UITextField!
    @IBOutlet weak var checkButton: UIButton!
    @IBOutlet weak var imageButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        nameLabel.text = incidence?.profile.name
        descriptionLabel.text = incidence?.description
        isCheck = (incidence?.resolved)!
        //updateImage(for: checkButton)
    }
    
    func handleResponse(incidente: Incidence?){
        
    }
    
    
    func handleError(error:Error){
        
        let message = "Error on Organizer Request:  \(error.localizedDescription)"
        
        os_log("%@",message)
        
    }
    
    func toggleCheck(button: UIButton) {
        if incidence != nil {
            isCheck = !isCheck
            self.incidence!.resolved = isCheck
            updateImage(for: button)
        }
    }
    
    

    @IBAction func sendUpdate(_ sender: UIButton) {
        OwnerIncidenceApi.UpdateIncidence(
            //idIncidence: (incidence?.incidenceId)!,
            idIncidence: "5d12b3114dc83453c01cfb27",
            incidenceUpdateRequest: IncidenceUpdateRequest(resolved: false, response: "La incidencia ha sido resuelta"),
            responseHandler: handleResponse,
            errorHandler: handleError)
    }
    
    @IBAction func checkAction(_ sender: UIButton) {
        toggleCheck(button: sender)
    }
    
    func updateImage(for button: UIButton) {
        let name = isCheck ?
            "checkTrue" : "checkFalse"
        let image = UIImage(named: name)
        //imageButton.setBackgroundImage(image, for: UIControl.State.normal)
    }
}
