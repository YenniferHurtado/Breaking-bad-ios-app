//
//  Repository.swift
//  MovieListApp
//
//  Created by Yennifer Jhoselin Hurtado Arce on 3/6/21.
//  Copyright © 2021 Yennifer Jhoselin Hurtado Arce. All rights reserved.
//

import Foundation
import RxSwift

public class RepositoryViewModel {
    
    let restApi: RestApi = RestApi.sharedInstance
    
    func movieDataCharacteres() -> Observable<[CharacterModel]> {
        
        let url = URLBuilder()
            .urlBase()
            .domain(.CHARACTERS)
            .build()
        
        return restApi.callResApiCharacter(url: url)
    }
    
    func movieDataEpisodes() -> Observable<[EpisodeModel]> {
        
        let url = URLBuilder()
            .urlBase()
            .domain(.EPISODES)
            .build()
        
        return restApi.callResApiEpisodes(url: url)
    }
    
//    public func movieDataQuotes() -> Void {
//
//        let url = URLBuilder()
//            .urlBase()
//            .domain(.QUOTES)
//            .build()
//
//        return restApi.callRestApi(url: url)
//    }
//
//    public func movieDataDeaths() -> Void {
//
//        let url = URLBuilder()
//            .urlBase()
//            .domain(.DEATHS)
//            .build()
//
//        return restApi.callRestApi(url: url)
//    }
    
}
