//
//  LoginViewModel.swift
//  WingsJourney
//
//  Created by Guilherme Medeiros Mergulhão on 06/09/23.
//

import Foundation

class LoginViewModel{
    private let loginModel: LoginProtocol = LoginModel()
    
    func performLogin(user: String, password: String, completion: @escaping ((Bool)->Void)){
        loginModel.login(user: user, password: password){ result in
            completion(result)
        }
    }
}
