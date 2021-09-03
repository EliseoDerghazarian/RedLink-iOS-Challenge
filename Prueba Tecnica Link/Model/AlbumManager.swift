//
//  AlbumManager.swift
//  Prueba Tecnica Link
//
//  Created by Eliseo Derghazarian on 30/08/2021.
//

import Foundation


struct AlbumManager {
    
    func fetchAlbumData(completionHandler: @escaping ([Album]) -> Void) {
        
        let albumURL = URL(string: "https://jsonplaceholder.typicode.com/albums")!
        
        let task = URLSession.shared.dataTask(with: albumURL) { data, response, error in
            guard let data = data else { return }
            
            do {
                let albumsData = try JSONDecoder().decode([Album].self, from: data)
                completionHandler(albumsData)
                
            }
            catch {
                let error = error
                print(error.localizedDescription)
            }
        }.resume()
    }
}





