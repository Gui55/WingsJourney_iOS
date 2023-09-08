//
//  LoginProtocol.swift
//  WingsJourney
//
//  Created by Guilherme Medeiros Mergulhão on 06/09/23.
//

import Foundation

protocol LoginProtocol{
    func login(user: String, password: String, completion: @escaping ((Bool)->Void))
}
