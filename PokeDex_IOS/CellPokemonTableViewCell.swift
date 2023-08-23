//
//  CellPokemonTableViewCell.swift
//  PokeDex_IOS
//
//  Created by Esteban Jiménez on 2023-08-23.
//

import UIKit

class CellPokemonTableViewCell: UITableViewCell {
    @IBOutlet weak var imgPokemon: UIImageView!
    @IBOutlet weak var nombrePokemon: UILabel!
    @IBOutlet weak var ataquePokemon: UILabel!
    @IBOutlet weak var defensaPokemon: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        imgPokemon.layer.cornerRadius = 15
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
