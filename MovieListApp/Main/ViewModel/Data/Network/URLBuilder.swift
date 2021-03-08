//
//  URLBuilder.swift
//  MovieListApp
//
//  Created by Yennifer Jhoselin Hurtado Arce on 3/6/21.
//  Copyright © 2021 Yennifer Jhoselin Hurtado Arce. All rights reserved.
//

import Foundation

enum ApiDomain : String {
    
    case CHARACTERS = "characters"
    case EPISODES = "episodes"
    case QUOTES = "quotes"
    case DEATHS = "deaths"
    
}

class URLBuilder {
    
    private var host : String = ""
    private var domain : String = ""
    
    func urlBase() -> URLBuilder {
        self.host = "https://breakingbadapi.com/api/"
        
        return self
    }
    
    func domain(_ domain: ApiDomain) -> URLBuilder {
        self.domain = domain.rawValue
        if !self.domain.hasSuffix("/") {
            self.domain += "/"
        }
        return self
    }
    
    func build() -> String {
        let url = "\(self.host)\(self.domain)"
        
        return url
    }
    
}
