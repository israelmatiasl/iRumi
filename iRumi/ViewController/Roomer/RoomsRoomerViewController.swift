//
//  RoomsRoomerViewController.swift
//  iRumi
//
//  Created by Miguel Angel cordova on 6/27/19.
//  Copyright © 2019 Israel Matias. All rights reserved.
//

import UIKit
import os

private let reuseIdentifier = "Cell"

class RoomRoomerCell: UICollectionViewCell {
    //    @IBOutlet weak var logoImageView: UIImageView!
    //    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    func update(from room: Room) {
        //        logoImageView.setImage(
        //            fromUrlString: source.urlToLogo,
        //            withDefaultImage: "no-image-available",
        //            withErrorImage: "no-image-available")
        nameLabel.text = room.roomId
        priceLabel.text = String(room.price)
    }
}

class RoomsRoomerViewController: UICollectionViewController {
    
    var rooms: [Room] = [Room]()
    var currentRow = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loadRooms()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.loadRooms()
        if rooms.count > 0 {
            self.collectionView.reloadItems(at: [IndexPath(item: currentRow, section: 0)])
        }
    }
    func loadRooms(){
        RumiApi.getRooms(responseHandler: handleResponse,
                         errorHandler: handleError)
    }
    func handleResponse(response: RoomsResponse?) {
        guard let rooms = response else {
            self.rooms = [Room]()
            return
        }
        self.rooms = rooms
        self.collectionView.reloadData()
    }
    
    func handleError(error: Error) {
        let message = "Error while requesting Sources: \(error.localizedDescription)"
        os_log("%@", message)
    }
    
    
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return rooms.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! RoomRoomerCell
        
        // Configure the cell
        cell.update(from: rooms[indexPath.row])
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showRoom" {
            let destination = segue.destination as! RoomRoomerViewController
            destination.room = rooms[currentRow]
        }
    }
    
//    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        currentRow = indexPath.item
//        performSegue(withIdentifier: "showRoom", sender: self)
//    }
    
}

