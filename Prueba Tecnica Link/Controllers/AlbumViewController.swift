//
//  ViewController.swift
//  Prueba Tecnica Link
//
//  Created by Eliseo Derghazarian on 30/08/2021.
//

import UIKit

class AlbumViewController: UIViewController, UISearchBarDelegate, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var albumManager = AlbumManager()
    var albums = [Album]()
    var filteredAlbums: [Album]!
    

    override func viewDidLoad() {
        super.viewDidLoad()
    
        
        // MARK: - Asignando Data Recibida
        
        AlbumManager().fetchAlbumData { (albums) in
            
            self.albums = albums
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        
        searchBar.delegate = self
        tableView.dataSource = self
        
        
        
        filteredAlbums = albums
        
        
        tableView.register(UINib(nibName: K.cellAlbumNibName, bundle: nil), forCellReuseIdentifier: K.albumCellIdentifier)
        
    }
    
    
    //Cuantas rows queremos
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if searchBar.text == "" {
            return albums.count
        } else {
            return filteredAlbums.count
        }
    
    }
    
    
    //Este metodo se llama la cantidad de veces como cuantos albums tengamos (albums.count)
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: K.albumCellIdentifier, for: indexPath) //Devuelve una celda reusable
            as! AlbumCell
        
        
        if searchBar.text == "" {
            cell.idLabel?.text = String(albums[indexPath.row].id)
            cell.titleLabel?.text = albums[indexPath.row].title
            return cell
        } else {
            cell.idLabel?.text = String(filteredAlbums[indexPath.row].id)
            cell.titleLabel?.text = filteredAlbums[indexPath.row].title
            return cell
        }
        
        
    
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showPhotos", sender: self)
    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? PhotoViewController {
            destination.albumsId = albums[(tableView.indexPathForSelectedRow?.row)!].id
        }
    }
    
    
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        filteredAlbums = []
        
        if searchText == "" {
            filteredAlbums = albums

        } else {

            for myAlbum in albums {
                if myAlbum.title.lowercased().contains(searchText.lowercased()) {
                    filteredAlbums.append(myAlbum)
                }
            }
        }

        self.tableView.reloadData()

    }
    

    
}









