//
//  DescriptionViewController.swift
//  MovieListApp
//
//  Created by Yennifer Jhoselin Hurtado Arce on 3/9/21.
//  Copyright © 2021 Yennifer Jhoselin Hurtado Arce. All rights reserved.
//

import UIKit

private let cellIdentifier = "HomeCell"

class DescriptionViewController: UIViewController, CollectionViewProtocol, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
 
    var viewModel = CharacterViewModel()
    var name = ""
    var birthday = ""
    var nickname = ""
    var imageCharacter = UIImage()
    
    let container = UIView()
    
    var imageCont: UIImage? {
        didSet {
            guard let image = imageCont else { return }
            contentView.image = image
        }
    }
    
    let contentView: UIImageView = {
        let view = UIImageView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        view.layer.borderWidth = 1.0
        view.layer.borderColor = UIColor.lightGray.cgColor
        return view
    }()
    
    let descriptionTextView: UITextView = {
        let textView = UITextView()
        textView.text = "Ahora puedes pagar \na otros bancos desde\n Tunki con Plin"
        textView.font = UIFont.boldSystemFont(ofSize: 18)
        textView.textAlignment = .center
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.isEditable = false
        textView.isScrollEnabled = false
        return textView
    }()
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionview = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionview.backgroundColor = .lightGray
        return collectionview
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        descriptionTextView.text = "Name: \(name)\nNickname: \(nickname)\nBirthday:\(birthday)"
                
        collectionView.delegate = self
        collectionView.dataSource = self
        
        viewModel.view = self
        viewModel.getDataCharacter()
        
        view.addSubview(container)
        view.addSubview(collectionView)

        container.insertSubview(contentView, at: 0)
        container.insertSubview(descriptionTextView, at: 1)

        container.anchorViewDescription(centerX: view.centerXAnchor, centerY: view.centerYAnchor)

        
        setupConstraints()
        
        // Register Cell
        
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        collectionView.register(CellView.self, forCellWithReuseIdentifier: cellIdentifier)
        
    }
    
    func setupConstraints() {
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        contentView.translatesAutoresizingMaskIntoConstraints = false

        collectionView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        collectionView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        collectionView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100).isActive = true
        
        contentView.widthAnchor.constraint(equalToConstant: 500).isActive = true
        contentView.heightAnchor.constraint(equalToConstant: 250).isActive = true

        
    }
    
    func listCharacter() {
        collectionView.reloadData()
    }

}

extension DescriptionViewController {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.characterModel.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell  = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! CellView
        cell.backgroundColor = .white
        
        let arr = viewModel.characterModel[indexPath.row].occupation
        cell.text = "\(arr![0])"

        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 250, height: 100)
    }
    
}


extension UIView {
    func anchorViewDescription(centerX: NSLayoutXAxisAnchor, centerY: NSLayoutYAxisAnchor) {
        
        translatesAutoresizingMaskIntoConstraints = false
    
        centerXAnchor.constraint(equalTo: centerX).isActive = true
        centerYAnchor.constraint(equalTo: centerY).isActive = true
        widthAnchor.constraint(equalToConstant: 800).isActive = true
        heightAnchor.constraint(equalToConstant: 800).isActive = true
        
    }
}
