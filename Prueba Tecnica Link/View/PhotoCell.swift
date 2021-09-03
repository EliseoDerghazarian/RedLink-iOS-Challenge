//
//  PhotoCell.swift
//  Prueba Tecnica Link
//
//  Created by Eliseo Derghazarian on 02/09/2021.
//

import UIKit

class PhotoCell: UITableViewCell {

    @IBOutlet weak var photoIdLabel: UILabel!
    @IBOutlet weak var photoTitleLabel: UILabel!
    @IBOutlet weak var photoImage: UIImageView!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
