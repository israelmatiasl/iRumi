//
//  IncidenceViewController.swift
//  iRumi
//
//  Created by Israel Matias on 6/27/19.
//  Copyright © 2019 Israel Matias. All rights reserved.
//

import UIKit

class IncidenceViewController: UIViewController {

    var incidence: Incidence?
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        descriptionLabel.text = incidence?.description
    }

}
