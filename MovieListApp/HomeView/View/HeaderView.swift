//
//  HomeCollectionHeader.swift
//  MovieListApp
//
//  Created by Yennifer Jhoselin Hurtado Arce on 3/8/21.
//  Copyright © 2021 Yennifer Jhoselin Hurtado Arce. All rights reserved.
//

import UIKit

class HeaderView: UICollectionReusableView {
    
    // MARK: - Properties
    
    let profileImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = #imageLiteral(resourceName: "quotes")
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.layer.borderWidth = 3
        iv.layer.borderColor = UIColor.white.cgColor
        return iv
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "Breaking Bad \n "
        label.font = UIFont.boldSystemFont(ofSize: 40)
        label.textColor = .white
        return label
    }()
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .mainGreen
        
        addSubview(profileImageView)
        addSubview(nameLabel)
        setupConstraint()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Constraint

    
    func setupConstraint() {
        
        profileImageView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        profileImageView.anchor(top: topAnchor, paddingTop: 88, width: 120, height: 120)
        profileImageView.layer.cornerRadius = 120 / 2
        nameLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        nameLabel.anchor(top: profileImageView.bottomAnchor, paddingTop: 12)

    }
    
}
