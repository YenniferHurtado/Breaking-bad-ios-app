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
    var textName = UILabel()
    
    let container = UIView()
    //    let contentView: UIImageView = {
//        let view = UIImageView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
//        view.layer.borderWidth = 1.0
//        view.backgroundColor = .red
//        view.layer.borderColor = UIColor.lightGray.cgColor
//        return view
//    }()
    
    let labelTxt: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width - 20.0, height: 50)
        label.backgroundColor = .blue
        label.textAlignment = .center
        label.font = UIFont(name: "verdana", size: 20)
        label.text = "prueba"

        return label
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let imageView = UIImageView(image: <#T##UIImage?#>)
        
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        viewModel.view = self
        viewModel.getDataCharacter()
        
        view.backgroundColor = .white
        view.addSubview(container)



        container.insertSubview(imageView, at: 0)

        container.anchorViewDescription(centerX: view.centerXAnchor, centerY: view.centerYAnchor)

        
        setupConstraints()
        
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
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionview = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionview.backgroundColor = .lightGray
        return collectionview
    }()
    
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
        widthAnchor.constraint(equalToConstant: 500).isActive = true
        heightAnchor.constraint(equalToConstant: 500).isActive = true
        
    }
}
