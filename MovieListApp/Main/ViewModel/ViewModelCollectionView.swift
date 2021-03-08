//
//  ViewModelCollectioView.swift
//  MovieListApp
//
//  Created by Yennifer Jhoselin Hurtado Arce on 3/6/21.
//  Copyright © 2021 Yennifer Jhoselin Hurtado Arce. All rights reserved.
//

import Foundation

class MovieCharacterCollectionViewModel {
    
    var restApi = RestApi()
    var repository = MovieDataRepository()

    func getDataCharacter() {
        repository.movieDataCharacteres()
    }
    
    func getDataEpisodes() {
        repository.movieDataEpisodes()
    }
    
    func getDataQuotes() {
        repository.movieDataQuotes()
    }
    
    func getDataDeaths() {
        repository.movieDataDeaths()
    }
}
