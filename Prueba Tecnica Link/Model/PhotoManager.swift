//
//  PhotoManager.swift
//  Prueba Tecnica Link
//
//  Created by Eliseo Derghazarian on 02/09/2021.
//

import Foundation


struct PhotoManager {
    
    func fetchPhotoData(completionHandler: @escaping ([Photo]) -> Void) {
        
        let photoURL = URL(string: "https://jsonplaceholder.typicode.com/photos")!
        
        let task = URLSession.shared.dataTask(with: photoURL) { data, response, error in
            guard let data = data else { return }
            
            do {
                let photosData = try JSONDecoder().decode([Photo].self, from: data)
                completionHandler(photosData)
                
            }
            catch {
                let error = error
                print(error.localizedDescription)
            }
        }.resume()
    }
}
