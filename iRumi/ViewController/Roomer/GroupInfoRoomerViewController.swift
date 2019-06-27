//
//  GroupInfoRoomerViewController.swift
//  iRumi
//
//  Created by Israel Matias on 6/27/19.
//  Copyright © 2019 Israel Matias. All rights reserved.
//

import UIKit
import os

class GroupInfoRoomerViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    var token:String = ""
    var group: Group!
    var participants: [Participant] = [Participant]()
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        token = UserDefaults.standard.string(forKey: DefaultKeys.Token) ?? ""
        getGroups()
    }
    
    func getGroups(){
        GroupApi.GetGroups(token: token, responseHandler: handleResponse, errorHandler: handleError)
    }
    
    func handleResponse(response: [Group]) {
        if (response.count > 0) {
            group = response[0]
            participants = group.participants
            self.collectionView.reloadData()
        }
    }
    
    func handleError(error: Error) {
        let message = "Error while requesting Groups: \(error.localizedDescription)"
        os_log("%@", message)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return participants.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ParticipantsRoomerCollectionViewCell", for: indexPath) as! ParticipantsRoomerCollectionViewCell
        let participant = participants[indexPath.item]
        cell.nameLabel.text = "\(participant.name!) \(participant.surname!)"
        if (participant.gender! == "Male" || participant.gender! == "male" || participant.gender! == "masculino") {
            cell.profileImageView.image = UIImage(named: "boy")
        }
        if (participant.gender! == "Female" || participant.gender! == "femenino") {
            cell.profileImageView.image = UIImage(named: "girl")
        }
        
        return cell
    }

}
