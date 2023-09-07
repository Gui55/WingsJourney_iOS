//
//  MockLogin.swift
//  WingsJourney
//
//  Created by Guilherme Medeiros Mergulhão on 06/09/23.
//

import Foundation

class MockLogin{
    func doLogin(user: String, password: String) -> Bool{
        return user == "admin" && password == "admin"
    }
}
