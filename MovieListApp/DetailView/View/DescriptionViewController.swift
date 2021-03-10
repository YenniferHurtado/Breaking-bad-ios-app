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
    
    let imageView: UIImageView = {
        let view = UIImageView(image: #imageLiteral(resourceName: "character"))
        view.contentMode = .scaleAspectFill
        return view
    }()
    
    let descriptionTextView: UITextView = {
        let textView = UITextView()
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
        collectionview.backgroundColor = .systemPink
        return collectionview
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("hhhhhh\(imageCharacter)")
                
        view.backgroundColor = .white
        descriptionTextView.text = "Name: \(name)\nNickname: \(nickname)\nBirthday:\(birthday)\n\n\n\nOcupación:"
                
        collectionView.delegate = self
        collectionView.dataSource = self
        
        viewModel.view = self
        viewModel.getDataCharacter()
        routeToHome()
        
        view.addSubview(collectionView)
        view.addSubview(imageView)
        view.addSubview(descriptionTextView)
        
        setupConstraints()
        
        // Register Cell
        
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        collectionView.register(CellView.self, forCellWithReuseIdentifier: cellIdentifier)
        
    }
    
    func setupConstraints() {
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        imageView.translatesAutoresizingMaskIntoConstraints = false

        collectionView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        collectionView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        collectionView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100).isActive = true
        
        imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        imageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 200).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        
        descriptionTextView.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 120).isActive = true
        descriptionTextView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        descriptionTextView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        descriptionTextView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -300).isActive = true


    }
    
    func listCharacter() {
        collectionView.reloadData()
    }
    
    func routeToHome() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(dismissView))
    }
    
    @objc private func dismissView() {
        dismiss(animated: true, completion: nil)
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
        
        let occupation = arr![0]
        cell.text = occupation

        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 250, height: 100)
    }
    
}

