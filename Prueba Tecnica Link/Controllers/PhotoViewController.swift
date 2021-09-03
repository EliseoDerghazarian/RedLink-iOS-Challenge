//
//  PhotoViewController.swift
//  Prueba Tecnica Link
//
//  Created by Eliseo Derghazarian on 02/09/2021.
//

import UIKit

class PhotoViewController: UIViewController, UITableViewDelegate {


    @IBOutlet weak var tableView: UITableView!
    
    var photoManager = PhotoManager()
    var photos = [Photo]()
    var albumsPictures: Photo?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(UINib(nibName: K.cellPhotoNibName, bundle: nil), forCellReuseIdentifier: K.photoCellIdentifier)
        
        // MARK: - Asignando Data Recibida
        
        PhotoManager().fetchPhotoData { (photos) in
            
            self.photos = photos
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    
    
    
    

    

}


extension PhotoViewController: UITableViewDataSource {
    
func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return photos.count
}

func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: K.photoCellIdentifier, for: indexPath) as! PhotoCell
    
    cell.photoIdLabel?.text = String(photos[indexPath.row].id)
    cell.photoTitleLabel?.text = String(photos[indexPath.row].title)
    //cell.photoImage?.image = photos[indexPath.row].thumbnailUrl
    return cell
}
}
