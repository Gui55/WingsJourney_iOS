//
//  LoginModel.swift
//  WingsJourney
//
//  Created by Guilherme Medeiros Mergulhão on 06/09/23.
//

import Foundation

class LoginModel: LoginProtocol{
    private let loginRepository = LoginRepository()
    
    func login(user: String, password: String, completion: @escaping ((String) -> Void)) {
        loginRepository.getLoginResult(user: user, password: password){ result in
            completion(result)
        }
    }
}
