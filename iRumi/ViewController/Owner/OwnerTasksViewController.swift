//
//  OwnerTasksViewController.swift
//  iRumi
//
//  Created by Sofia  on 6/27/19.
//  Copyright © 2019 Sofia castillo. All rights reserved.
//
import UIKit

class OwnerTasksViewController: UIViewController {
    
    @IBOutlet weak var tasksTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tasksTableView.dataSource = self
    }
}
extension OwnerTasksViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TaskCell", for: indexPath)
        return cell
    }
}

