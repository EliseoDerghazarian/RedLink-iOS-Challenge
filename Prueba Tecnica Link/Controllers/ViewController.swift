//
//  ViewController.swift
//  Prueba Tecnica Link
//
//  Created by Eliseo Derghazarian on 30/08/2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var albumManager = AlbumManager()
    
    var albums = [Album]()

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.register(UINib(nibName: K.cellNibName, bundle: nil), forCellReuseIdentifier: K.cellIdentifier)
        
        
        
        AlbumManager().fetchAlbumData { (albums) in
            
            self.albums = albums
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
}

extension ViewController: UITableViewDataSource {
    
    //Cuantas rows queremos
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return albums.count
    }
    
    
    //Este metodo se llama la cantidad de veces como cuantos albums tengamos (albums.count)
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: K.cellIdentifier, for: indexPath) //Devuelve una celda reusable
            as! AlbumCell
            
        cell.idLabel.text = String(albums[indexPath.row].id)
        cell.titleLabel.text = albums[indexPath.row].title
        return cell
    }
    
    
}
    




