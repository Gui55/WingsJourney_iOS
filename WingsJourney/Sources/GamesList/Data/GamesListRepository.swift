//
//  GamesListRepository.swift
//  WingsJourney
//
//  Created by Guilherme Medeiros Mergulhão on 04/09/23.
//

import Foundation

class GamesListRepository{
    private var gamesAPI = GamesAPI()
        
    func getGames(completionClosure: @escaping ([Game]) -> Void){
        gamesAPI.callService{ result in
            completionClosure(result)
        }
    }
}
