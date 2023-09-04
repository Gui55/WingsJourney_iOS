//
//  GamesListModel.swift
//  WingsJourney
//
//  Created by Guilherme Medeiros Mergulhão on 04/09/23.
//

import Foundation

class GamesListModel: GamesListProtocol{
    let repository = GamesListRepository()
    
    func getGames(completionClosure: @escaping ([Game]) -> Void) {
        repository.getGames{ result in
            completionClosure(result)
        }
    }
}
