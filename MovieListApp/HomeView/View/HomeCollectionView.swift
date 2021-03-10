//
//  ViewControllerCollectionView.swift
//  MovieListApp
//
//  Created by Yennifer Jhoselin Hurtado Arce on 3/6/21.
//  Copyright © 2021 Yennifer Jhoselin Hurtado Arce. All rights reserved.
//

import UIKit

private let cellIdentifier = "HomeCell"
private let headerIdentifier = "HomeHeader"

protocol CollectionViewProtocol {
    
    func listCharacter()
}


class CollectionViewController: UICollectionViewController, CollectionViewProtocol {
    
    
    // MARK: - Properties
    
    var viewModel = CharacterViewModel()

    // MARK: - Lifecycle
        
        override func viewDidLoad() {
            super.viewDidLoad()

            collectionView.backgroundColor = .black
            viewModel.view = self
            viewModel.getDataCharacter()

            // register header
            collectionView!.register(HeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerIdentifier)
            
            // register cell
            collectionView.register(CellView.self, forCellWithReuseIdentifier: cellIdentifier)
            
            collectionView.contentInsetAdjustmentBehavior = .never
            
        }
        
        override var preferredStatusBarStyle: UIStatusBarStyle {
            return .lightContent
        }
    
        func listCharacter() {
            collectionView.reloadData()
        }

        func getData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
            URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
        }
    
    }



    // MARK: - UICollectionViewDelegate/DataSource

    extension CollectionViewController {
        
        override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerIdentifier, for: indexPath) as! HeaderView
            return header
        }
        
        override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return viewModel.characterModel.count
        }
        
        override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! CellView
            
            if viewModel.characterModel.count > 0 {
                
                cell.text = viewModel.characterModel[indexPath.row].name
                
                let urlImage:URL = URL.init(string: viewModel.characterModel[indexPath.row].img!)!
                getData(from: urlImage) { data, response, error in
                    guard let data = data, error == nil else { return }
                    print(response?.suggestedFilename ?? urlImage.lastPathComponent)
                    DispatchQueue.main.async() { [weak self] in
                        cell.image = UIImage(data: data)
                    }
                }
            }else{
                cell.text = viewModel.characterModel[indexPath.row].name
            }
            
            return cell
        }
        

        override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            
            routeToDescriptionViewController()
        }
        
        func routeToDescriptionViewController() {
            let viewController = DescriptionViewController()
            let navViewController = UINavigationController(rootViewController: viewController)
            navViewController.modalPresentationStyle = .fullScreen
            present(navViewController, animated: true)
        }
        
    }

    // MARK: - UICollectionViewDelegateFlowLayout

    extension CollectionViewController: UICollectionViewDelegateFlowLayout {
        
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
            return CGSize(width: view.frame.width, height: 300)
        }
        
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
            return 1
        }
        
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
            return 1
        }
        
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            let width = (view.frame.width - 2) / 2
            return CGSize(width: width, height: width)
        }
        
    }

    extension UIColor {
        static func rgb(red: CGFloat, green: CGFloat, blue: CGFloat) -> UIColor {
            return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: 1)
        }
        
        static let mainGreen = UIColor(red: 0.04, green: 0.19, blue: 0.07, alpha: 1.00)


    }

    extension UIView {
        
        func anchor(top: NSLayoutYAxisAnchor? = nil, left: NSLayoutXAxisAnchor? = nil, bottom: NSLayoutYAxisAnchor? = nil, right: NSLayoutXAxisAnchor? = nil, paddingTop: CGFloat? = 0,
                    paddingLeft: CGFloat? = 0, paddingBottom: CGFloat? = 0, paddingRight: CGFloat? = 0, width: CGFloat? = nil, height: CGFloat? = nil) {
            
            translatesAutoresizingMaskIntoConstraints = false
            
            if let top = top {
                topAnchor.constraint(equalTo: top, constant: paddingTop!).isActive = true
            }
            
            if let left = left {
                leftAnchor.constraint(equalTo: left, constant: paddingLeft!).isActive = true
            }
            
            if let bottom = bottom {
                if let paddingBottom = paddingBottom {
                    bottomAnchor.constraint(equalTo: bottom, constant: -paddingBottom).isActive = true
                }
            }
            
            if let right = right {
                if let paddingRight = paddingRight {
                    rightAnchor.constraint(equalTo: right, constant: -paddingRight).isActive = true
                }
            }
            
            if let width = width {
                widthAnchor.constraint(equalToConstant: width).isActive = true
            }
            
            if let height = height {
                heightAnchor.constraint(equalToConstant: height).isActive = true
            }
        }
    }

