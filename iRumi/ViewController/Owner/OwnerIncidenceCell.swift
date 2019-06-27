//
//  OwnerIncidenceCell.swift
//  iRumi
//
//  Created by Israel Matias on 6/27/19.
//  Copyright © 2019 Israel Matias. All rights reserved.
//

import UIKit

class OwnerIncidenceCell: UICollectionViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    func update(from incidence: Incidence) {
        
        titleLabel.text = incidence.description
        nameLabel.text = incidence.profile.name
    }
}
