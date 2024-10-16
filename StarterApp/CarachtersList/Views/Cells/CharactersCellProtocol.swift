//
//  CharactersCellProtocol.swift
//  StarterApp
//
//  Created by Mina Yousry on 10/01/2023.
//

import Foundation
import UIKit

protocol CharactersCellProtocol: AnyObject where Self: UITableViewCell{
    
    func configure(entity: CharactersDisplayableEntity)
}
