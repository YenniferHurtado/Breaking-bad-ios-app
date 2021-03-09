//
//  ViewModelCollectioView.swift
//  MovieListApp
//
//  Created by Yennifer Jhoselin Hurtado Arce on 3/6/21.
//  Copyright © 2021 Yennifer Jhoselin Hurtado Arce. All rights reserved.
//

import Foundation
import UIKit
import RxSwift

public class EpisodeViewModel {
    
    var view: CollectionViewProtocol?
    let images: [UIImage] = [#imageLiteral(resourceName: "character"), #imageLiteral(resourceName: "quotes"), #imageLiteral(resourceName: "episodes"), #imageLiteral(resourceName: "deaths")]
    var episodeModel = [EpisodeModel]()
    var characterModel = [CharacterModel]()
        
    var repository = RepositoryViewModel()
    
    func getDataEpisodes() {
        let observable = repository.movieDataEpisodes()
        observable
            .observeOn(MainScheduler.instance)
            .subscribe(onNext: { ( list ) in
                self.episodeModel = list
                self.view?.listEpisodes()
            }, onError: { ( error ) in
                
            }, onCompleted: {
                
            }) {
                
        }
    }
    
    func getDataCharacter() {
        repository.movieDataCharacteres()
        let observable = repository.movieDataCharacteres()
        observable
            .observeOn(MainScheduler.instance)
            .subscribe(onNext: { ( char ) in
                self.characterModel = char
            }, onError: { ( error ) in
            
            }, onCompleted: {
                
            }) {
                
        }
    }
    
}
