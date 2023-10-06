//
//  LoginRequest.swift
//  WingsJourney
//
//  Created by Guilherme Medeiros Mergulhão on 05/10/23.
//

import Foundation

struct AuthenticationRequest: Codable{
    let username: String
    let password: String
}
