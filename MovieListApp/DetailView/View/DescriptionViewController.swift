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

class DescriptionViewController: UIViewController {
 
    var viewModel = CharacterViewModel()
    var textName = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.getDataCharacter()

        
        view.backgroundColor = .purple
        textName.frame = CGRect(x: 0, y: 0, width: 250, height: 100)
        textName.text = viewModel
        textName.font = UIFont.boldSystemFont(ofSize: 40)

        textName.center = self.view.center
        
        self.view.addSubview(textName)
        
    }

}
