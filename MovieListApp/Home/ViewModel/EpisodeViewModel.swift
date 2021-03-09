//
//  ViewModelCollectioView.swift
//  MovieListApp
//
//  Created by Yennifer Jhoselin Hurtado Arce on 3/6/21.
//  Copyright © 2021 Yennifer Jhoselin Hurtado Arce. All rights reserved.
//

import Foundation

class EpisodeViewModel {
    
//    let apiService: APIServiceProtocol
    
    var repository = RepositoryViewModel()
    
    func getDataEpisodes() {
        repository.movieDataEpisodes()
    }
    
    func getDataCharacter() {
        repository.movieDataCharacteres()
    }
    
    func getDataQuotes() {
        repository.movieDataQuotes()
    }
    
    func getDataDeaths() {
        repository.movieDataDeaths()
    }
}
