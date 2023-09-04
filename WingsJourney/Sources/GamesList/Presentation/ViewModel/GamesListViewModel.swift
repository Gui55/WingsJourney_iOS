//
//  GamesListViewModel.swift
//  WingsJourney
//
//  Created by Guilherme Medeiros Mergulhão on 04/09/23.
//

import Foundation

class GamesListViewModel{
    private var gamesAPI = GamesAPI()
    
    var gamesList: (([Game]) -> Void)?
    
    func getGames(){
        gamesAPI.callService(){ [weak self] result in
            self?.gamesList?(result)
        }
    }
}
