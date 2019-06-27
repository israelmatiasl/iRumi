//
//  IncidenceCell.swift
//  iRumi
//
//  Created by Israel Matias on 6/27/19.
//  Copyright © 2019 Israel Matias. All rights reserved.
//

import UIKit

class IncidenceCell: UICollectionViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var namegroupLabel: UILabel!
    
    func update(from incidence: Incidence) {
        
        
        nameLabel.text = incidence.description
    }
    
    
    func updateGroup(from group: Group) {
        
        
        namegroupLabel.text = group.participants[0].name
    }
}
