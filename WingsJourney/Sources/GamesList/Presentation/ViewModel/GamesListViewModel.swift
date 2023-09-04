//
//  GamesListViewModel.swift
//  WingsJourney
//
//  Created by Guilherme Medeiros Mergulhão on 04/09/23.
//

import Foundation

class GamesListViewModel{
    private var gamesListProtocol: GamesListProtocol = GamesListModel()
            
    func performFetchGames(gamesListClosure: @escaping (([Game]) -> Void)){
        gamesListProtocol.getGames{result in
            gamesListClosure(result)
        }
    }
}
