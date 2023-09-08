//
//  GamesAPI.swift
//  WingsJourney
//
//  Created by Guilherme Medeiros Mergulhão on 08/05/23.
//

import Foundation

class GamesAPI {
    
    func callService(completion: @escaping ([Game]) -> Void){
        if let url = URL(string: "http://localhost:8081/games"){
            let task = URLSession.shared.dataTask(with: url) { data, response, error in
                
                if let gamesData = data {
                    do{
                        let parsingData = try JSONDecoder().decode([Game].self, from: gamesData)
                        completion(parsingData)
                    } catch {
                        print(String(describing: error))
                    }
                }
                
            }
            task.resume()
        }
    }
    
}
