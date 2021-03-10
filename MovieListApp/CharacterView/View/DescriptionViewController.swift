//
//  DescriptionViewController.swift
//  MovieListApp
//
//  Created by Yennifer Jhoselin Hurtado Arce on 3/9/21.
//  Copyright © 2021 Yennifer Jhoselin Hurtado Arce. All rights reserved.
//

import UIKit

private let cellIdentifier = "HomeCell"
private let headerIdentifier = "HomeHeader"

protocol DescriptionViewControllerProtocol {
    
    func listCharacters()
}

class DescriptionViewController: UIViewController, DescriptionViewControllerProtocol {
 
    // MARK: - Properties
    
    var viewModel = DescriptionViewModel()

    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.view = self
        viewModel.getDataCharacter()
    }
    
    func listCharacters() {
        print("hh")
    }

}
