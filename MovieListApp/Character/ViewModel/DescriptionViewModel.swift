//
//  DescriptionViewModel.swift
//  MovieListApp
//
//  Created by Yennifer Jhoselin Hurtado Arce on 3/9/21.
//  Copyright © 2021 Yennifer Jhoselin Hurtado Arce. All rights reserved.
//

import Foundation
import UIKit
import RxSwift

public class DescriptionViewModel {
    
    var view: DescriptionViewController?
    var characterModel = [CharacterModel]()
    var repository = RepositoryViewModel()
    
}

// MARK: - RESULT OBSERVABLE EPISODE DATA

extension DescriptionViewModel {
    
    func getDataCharacter() {
        let observable = repository.movieDataCharacteres()
            observable
                .observeOn(MainScheduler.instance)
                .subscribe(
                    onNext: onNext(),
                    onError: onError(),
                    onCompleted: onComplete(),
                    onDisposed: onDisposed()
        )
    }
    
    func onNext()->([CharacterModel])->Void {
            
        let onNext: ([CharacterModel])->Void = { response  in
            self.characterModel = response
            self.view?.listCharacters()
        }
        return onNext
    }
    
    func onError()->(Error)->Void {
        
        let onError:(Error)->Void = { error in
            
        }
        return onError
    }
    
    func onComplete()-> ()-> Void {
        let onCompleted:()->Void = {
            
        }
        return onCompleted
    }
    
    func onDisposed()-> ()-> Void {
        let onDisposed:()->Void = {
            
        }
        return onDisposed
    }
}


//func getDataCharacter() {
//
//    let observable = repository.movieDataCharacteres()
//    observable
//        .observeOn(MainScheduler.instance)
//        .subscribe(onNext: { ( char ) in
//            self.characterModel = char
//        }, onError: { ( error ) in
//
//        }, onCompleted: {
//
//        }) {
//
//    }
//}
