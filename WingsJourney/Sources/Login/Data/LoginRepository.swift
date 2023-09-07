//
//  LoginRepository.swift
//  WingsJourney
//
//  Created by Guilherme Medeiros Mergulhão on 06/09/23.
//

import Foundation

class LoginRepository{
    private let source = MockLogin()
    
    func getLoginResult(user: String, password: String, completion: @escaping ((Bool)->Void)){
        completion(source.doLogin(user: user, password: password))
    }
}
