//
//  BigCharacterTableViewCell.swift
//  StarterApp
//
//  Created by Mina Yousry on 10/01/2023.
//

import UIKit

class BigCharacterTableViewCell: UITableViewCell, CharactersCellProtocol {

    @IBOutlet weak var characterImage: UIImageView!
    @IBOutlet weak var characterNameLbl: UILabel!
    @IBOutlet weak var characterDescriptionLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func configure(entity: CharactersDisplayableEntity) {
        self.characterNameLbl.text = entity.name
        self.characterDescriptionLbl.text = entity.resultDescription
        self.characterImage.kf.setImage(with: URL(string: entity.thumbnailUrl ?? ""))
    }
}
