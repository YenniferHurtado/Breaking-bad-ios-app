//
//  ViewControllerCollectionViewCell.swift
//  MovieListApp
//
//  Created by Yennifer Jhoselin Hurtado Arce on 3/6/21.
//  Copyright © 2021 Yennifer Jhoselin Hurtado Arce. All rights reserved.
//

import UIKit

class CellView: UICollectionViewCell {
    
    // MARK: - Properties
    
    let container = UIView()
    
    var image: UIImage? {
        didSet {
            guard let image = image else { return }
            cellImageView.image = image
        }
    }
    
    var text: String? {
        didSet {
            guard let texto = text else { return }
            episodeTittleTextView.text = texto
        }
    }
    
    
    var cellImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = #imageLiteral(resourceName: "deaths")
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.layer.borderWidth = 6
        iv.layer.cornerRadius = 5
        iv.layer.borderColor = UIColor.white.cgColor
        
        return iv
    }()
    
    var episodeTittleTextView: UITextView = {
        let textView = UITextView()
        textView.text = "Titulo"
        textView.font = UIFont.boldSystemFont(ofSize: 20)
        textView.textAlignment = .center
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.isEditable = false
        textView.isScrollEnabled = false
        textView.backgroundColor = .systemBlue
        textView.textColor = .white
        textView.layer.borderWidth = 1
        textView.layer.cornerRadius = 8
        textView.layer.borderColor = UIColor.white.cgColor
        return textView
    }()
    
    // MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(container)
        container.insertSubview(cellImageView, at: 0)
        container.insertSubview(episodeTittleTextView, at: 1)
        episodeTittleTextView.anchor(centerX: cellImageView.centerXAnchor, centerY: cellImageView.centerYAnchor)
        setupLayaout()
    }
    
    func setupLayaout() {
//        episodeTittleTextView.topAnchor.constraint(equalTo: container.topAnchor, constant: 75).isActive = true
//        episodeTittleTextView.leftAnchor.constraint(equalTo: container.leftAnchor, constant: 10).isActive = true
        episodeTittleTextView.anchor()
        cellImageView.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor)

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Selector
    
    @objc func handleImageCell() {
        print("Message user here..")
    }
    
}

extension UIView {
    func anchor(centerX: NSLayoutXAxisAnchor, centerY: NSLayoutYAxisAnchor) {
        
        translatesAutoresizingMaskIntoConstraints = false
    
        centerXAnchor.constraint(equalTo: centerX).isActive = true
        centerYAnchor.constraint(equalTo: centerY).isActive = true
        
    }
}
