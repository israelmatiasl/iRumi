//
//  RoomController.swift
//  TEST3
//
//  Created by Miguel Angel cordova on 6/26/19.
//  Copyright © 2019 Miguel Angel cordova. All rights reserved.
//

import UIKit
import os

class RoomViewController: UIViewController {
    var room: Room?
    
    @IBOutlet weak var tituloLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
//        tituloLabel.text = room!.title
        priceLabel.text = String(room!.price)
    }
    
    @IBAction func deleteButton(_ sender: Any) {
        RumiApi.deleteRooms(RoomId: room!.roomId, responseHandler: handleResponse, errorHandler: handleError)
    }
    func handleResponse(response: Bool) {
        self.showToast(message: "Delete!")
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

