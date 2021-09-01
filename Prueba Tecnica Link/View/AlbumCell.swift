//
//  AlbumCell.swift
//  Prueba Tecnica Link
//
//  Created by Eliseo Derghazarian on 31/08/2021.
//

import UIKit

class AlbumCell: UITableViewCell {

    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
