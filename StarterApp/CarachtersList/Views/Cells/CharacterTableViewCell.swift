//
//  CharacterTableViewCell.swift
//  StarterApp
//
//  Created by Mina Yousry on 29/12/2022.
//

import UIKit
import Kingfisher

class CharacterTableViewCell: UITableViewCell, CharactersCellProtocol {
    
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
