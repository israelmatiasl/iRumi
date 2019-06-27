//
//  GroupsOwnerViewController.swift
//  iRumi
//
//  Created by Israel Matias on 6/26/19.
//  Copyright © 2019 Israel Matias. All rights reserved.
//

import UIKit
import os

class GroupsOwnerViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var token:String = ""
    var groups: [Group] = [Group]()
    var group: Group!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        token = UserDefaults.standard.string(forKey: DefaultKeys.Token) ?? ""
        getGroups()
    }
    

    func getGroups(){
        GroupApi.GetGroups(token: token, responseHandler: handleResponse, errorHandler: handleError)
    }
    
    func handleResponse(response: [Group]) {
        groups = response
        self.collectionView.reloadData()
    }
    
    func handleError(error: Error) {
        let message = "Error while requesting Groups: \(error.localizedDescription)"
        os_log("%@", message)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return groups.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GroupsCollectionViewCell", for: indexPath) as! GroupsCollectionViewCell
        cell.groupNameLabel.text = groups[indexPath.item].name
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //print("didSelectedItemAt \(indexPath)")
        self.group = groups[indexPath.item]
        performSegue(withIdentifier: "toParticipants", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let groupInfo = segue.destination as? GroupInfoOwnerViewController else { return }
        groupInfo.group = self.group
    }
}
