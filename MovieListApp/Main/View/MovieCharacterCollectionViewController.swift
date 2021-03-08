//
//  ViewControllerCollectionView.swift
//  MovieListApp
//
//  Created by Yennifer Jhoselin Hurtado Arce on 3/6/21.
//  Copyright © 2021 Yennifer Jhoselin Hurtado Arce. All rights reserved.
//

import UIKit

class MovieCharacterCollectionViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    private var collectionView: UICollectionView?
    var viewModel = MovieCharacterCollectionViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureViewDataCharacter()
        
        let layout = UICollectionViewFlowLayout()
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        guard let collectionView = collectionView else {
            return
        }
        
        collectionView.register(MovieCharacterCollectionViewCell.self, forCellWithReuseIdentifier: MovieCharacterCollectionViewCell.identifier)
        collectionView.dataSource = self
        collectionView.delegate = self
        view.addSubview(collectionView)
        collectionView.frame = view.bounds
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 30
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MovieCharacterCollectionViewCell.identifier, for: indexPath)
        
        return cell
    }


}

extension MovieCharacterCollectionViewController {
    
    func configureViewDataCharacter() {
        viewModel.getDataCharacter()
    }
}
