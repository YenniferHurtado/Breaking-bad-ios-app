//
//  RestApi.swift
//  MovieListApp
//
//  Created by Yennifer Jhoselin Hurtado Arce on 3/6/21.
//  Copyright © 2021 Yennifer Jhoselin Hurtado Arce. All rights reserved.
//

import Foundation
import Alamofire

public class RestApi {
    
    public static let sharedInstance = RestApi()
    var characterModel = [MovieCharacterModel]()
    
    func callRestApi(url: String) {
        
        AF.request(url).response { response in
            if let data = response.data {
                do {
                    let response = try JSONDecoder().decode([MovieCharacterModel].self, from: data)
                    self.characterModel.append(contentsOf: response)
                    DispatchQueue.main.async {
                        print(response)
                    }
                } catch let error {
                    print(error.localizedDescription)
                }
            }
        }
    }
}
