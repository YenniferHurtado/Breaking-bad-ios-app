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
    
}
