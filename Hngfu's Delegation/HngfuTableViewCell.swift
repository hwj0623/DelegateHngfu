//
//  HngfuTableViewCell.swift
//  Hngfu's Delegation
//
//  Created by 조재흥 on 19. 6. 22..
//  Copyright © 2019 hngfu. All rights reserved.
//

import UIKit

class HngfuTableViewCell: UITableViewCell {
    @IBOutlet weak var pokemonImageView: UIImageView!
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    
    func show(with pokemonInfo: PokemonInfo) {
        pokemonImageView.image = UIImage(named: pokemonInfo.name)
        numberLabel.text = "#\(pokemonInfo.number)"
        nameLabel.text = pokemonInfo.name
        typeLabel.text = pokemonInfo.type
    }
}
