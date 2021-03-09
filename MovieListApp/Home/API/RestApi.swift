//
//  RestApi.swift
//  MovieListApp
//
//  Created by Yennifer Jhoselin Hurtado Arce on 3/6/21.
//  Copyright © 2021 Yennifer Jhoselin Hurtado Arce. All rights reserved.
//

import Foundation
import Alamofire
import RxSwift

protocol APIServiceProtocol {
    func callRestApi(url: String)

}

public class RestApi: APIServiceProtocol {
    
    public static let sharedInstance = RestApi()
    var characterModel = [EpisodeModel]()
    
    func callRestApi(url: String) {
        
        AF.request(url).response { response in
            if let data = response.data {
                do {
                    let response = try JSONDecoder().decode([EpisodeModel].self, from: data)
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
    
    func callResApiData(url: String) -> Observable<[EpisodeModel]> {
        
        let observable: Observable<[EpisodeModel]> = Observable.create { ( observer ) in
            AF.request(url).response { response in
                if let data = response.data {
                    do {
                        let response = try JSONDecoder().decode([EpisodeModel].self, from: data)
                        self.characterModel.append(contentsOf: response)
                        
                        observer.onNext(self.characterModel)
                        observer.onCompleted()
                        print(response)

                    } catch let error {
                        observer.onError(error)
                        print(error.localizedDescription)
                    }
                }
            }
             return Disposables.create {}
        }
        
        return observable
    }
    
}
