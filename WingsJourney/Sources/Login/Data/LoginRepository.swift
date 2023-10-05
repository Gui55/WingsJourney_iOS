//
//  LoginRepository.swift
//  WingsJourney
//
//  Created by Guilherme Medeiros Mergulhão on 06/09/23.
//

import Foundation

class LoginRepository{
    private let source = LoginAPI()
    
    func getLoginResult(user: String, password: String, completion: @escaping ((String)->Void)){
        source.callService(user: user, password: password){ result in
            completion(result.token)
        }
    }
}
