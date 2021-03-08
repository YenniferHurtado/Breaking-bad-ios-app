//
//  ViewControllerCollectionViewCell.swift
//  MovieListApp
//
//  Created by Yennifer Jhoselin Hurtado Arce on 3/6/21.
//  Copyright © 2021 Yennifer Jhoselin Hurtado Arce. All rights reserved.
//

import UIKit

class MovieCharacterCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "ViewControllerCollectionViewCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .systemRed
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(code:) has not implemented")
    }
    
}
