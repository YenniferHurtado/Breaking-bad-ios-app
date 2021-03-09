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
    
    let container = UIButton()
    
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
    
//    var idText: UITextView? {
//        didSet {
//            guard let idTxt = idText else { return }
//            idTextView.text = "\(idTxt)"
//        }
//    }
    
    var cellImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = #imageLiteral(resourceName: "deaths")
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        
        return iv
    }()
    
    var cellImageButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(#imageLiteral(resourceName: "deaths").withRenderingMode(.alwaysOriginal), for: .normal)
        button.addTarget(self, action: #selector(handleImageCell), for: .touchUpInside)
        return button
    }()
    
    var episodeTittleTextView: UITextView = {
        let textView = UITextView()
        textView.text = "Titulo Ep"
        textView.font = UIFont.boldSystemFont(ofSize: 25)
        textView.textAlignment = .center
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.isEditable = false
        textView.isScrollEnabled = false
        return textView
    }()
    
    var idTextView: UITextView = {
        let textView = UITextView()
        textView.text = "\(1)"
        textView.font = UIFont.boldSystemFont(ofSize: 25)
        textView.textAlignment = .center
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.isEditable = false
        textView.isScrollEnabled = false
        return textView
    }()
    
    // MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(container)
        container.insertSubview(cellImageView, at: 0)
        container.insertSubview(episodeTittleTextView, at: 1)
        container.insertSubview(idTextView, at: 2)

        setupLayaout()
    }
    
    func setupLayaout() {
        episodeTittleTextView.topAnchor.constraint(equalTo: container.topAnchor, constant: 75).isActive = true
        episodeTittleTextView.leftAnchor.constraint(equalTo: container.leftAnchor, constant: 50).isActive = true
        idTextView.topAnchor.constraint(equalTo: container.topAnchor, constant: 75).isActive = true
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
