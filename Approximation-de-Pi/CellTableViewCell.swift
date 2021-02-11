//
//  CellTableViewCell.swift
//  Approximation-de-Pi
//
//  Created by Anthony Peres da Cruz on 11/02/2021.
//

import UIKit

class CellTableViewCell: UITableViewCell {
    
    @IBOutlet weak var label: UILabel!
    
    // Fonction appelée apres le chargement du .nib (fichier interface).
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    // Définit l'état sélectionné de la cellule, en animant éventuellement la transition entre les états.
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
