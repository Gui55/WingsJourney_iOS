//
//  Game.swift
//  WingsJourney
//
//  Created by Guilherme Medeiros Mergulhão on 08/05/23.
//

import Foundation

struct Game: Codable{
    
    let id: Int
    let name: String
    let company: String
    let image: String
    let genre: String
    let description: String
    let likes: Int
    let dislikes: Int
    
}
