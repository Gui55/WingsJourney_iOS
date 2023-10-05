//
//  GlobalValues.swift
//  WingsJourney
//
//  Created by Guilherme Medeiros Mergulhão on 05/10/23.
//

import Foundation

class GlobalValues{
    private static let users = UserDefaults.standard
    
    static func registerToken(token: String){
        users.set("Bearer "+token, forKey: "token")
    }
}
