//
//  AddRoomViewController.swift
//  iRumi
//
//  Created by Miguel Angel cordova on 6/27/19.
//  Copyright © 2019 Israel Matias. All rights reserved.
//

import UIKit
import os

class AddRoomViewController: UIViewController {
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var descriptionTextField: UITextField!
    @IBOutlet weak var priceTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func AddRoomBtn(_ sender: Any) {
        let roomRequest = RoomRequest(
            AccountId : "5caeb4e35c5d2786089c83f8",
            Title : titleTextField.text ?? "",
            Description : descriptionTextField.text ?? "",
            IsFurnished : true,
            Price : Int(priceTextField.text!) ?? 111
        )
        RumiApi.saveRooms(RoomRequest:roomRequest,responseHandler: handleResponse,
                          errorHandler: handleError)
    }
    func handleResponse(response: Room) {
        self.showToast(message: "Success!")
    }
    
    func handleError(error: Error) {
        let message = "Error while requesting SignIn: \(error.localizedDescription)"
        os_log("%@", message)
    }
    
    func showToast(message : String) {
        
        let toastLabel = UILabel(frame: CGRect(x: self.view.frame.size.width/2 - 75, y: self.view.frame.size.height-200, width: 150, height: 35))
        toastLabel.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        toastLabel.textColor = UIColor.white
        toastLabel.textAlignment = .center;
        toastLabel.font = UIFont(name: "Montserrat-Light", size: 12.0)
        toastLabel.text = message
        toastLabel.alpha = 1.0
        toastLabel.layer.cornerRadius = 10;
        toastLabel.clipsToBounds  =  true
        self.view.addSubview(toastLabel)
        UIView.animate(withDuration: 4.0, delay: 0.1, options: .curveEaseOut, animations: {
            toastLabel.alpha = 0.0
        }, completion: {(isCompleted) in
            toastLabel.removeFromSuperview()
        })
    }
    
}
