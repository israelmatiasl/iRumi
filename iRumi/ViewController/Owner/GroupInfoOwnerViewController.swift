//
//  GroupInfoOwnerViewController.swift
//  iRumi
//
//  Created by Israel Matias on 6/26/19.
//  Copyright © 2019 Israel Matias. All rights reserved.
//

import UIKit

class GroupInfoOwnerViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    var group:Group!
    var participants: [Participant] = [Participant]()

    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        //self.titleLabel.text = self.group.name
        self.participants = self.group.participants
    }
    

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return participants.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ParticipantsCollectionViewCell", for: indexPath) as! ParticipantsCollectionViewCell
        let participant = participants[indexPath.item]
        cell.nameLabel.text = "\(participant.name!) \(participant.surname!)"
        if (participant.gender! == "Male") {
            cell.profileImageView.image = UIImage(named: "boy")
        }
        if (participant.gender! == "Female") {
            cell.profileImageView.image = UIImage(named: "girl")
        }
        
        return cell
    }

}
