//
//  GamesListProtocol.swift
//  WingsJourney
//
//  Created by Guilherme Medeiros Mergulhão on 04/09/23.
//

import Foundation

protocol GamesListProtocol{
    func getGames(completionClosure: @escaping ([Game]) -> Void)
}
