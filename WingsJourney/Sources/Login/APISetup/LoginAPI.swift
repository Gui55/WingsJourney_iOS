//
//  LoginAPI.swift
//  WingsJourney
//
//  Created by Guilherme Medeiros Mergulhão on 05/10/23.
//

import Foundation

class LoginAPI{
    
    func callService(user: String, password: String, completion: @escaping (AuthenticationResponse) -> Void){

        let loginData = try? JSONEncoder().encode(AuthenticationRequest(username: user, password: password))
        
        if let lData = loginData{
            if let url = URL(string: "http://localhost:8081/authenticate"){
                var request = URLRequest(url: url)
                request.httpMethod = "POST"
                request.httpBody = lData
                request.setValue("application/json", forHTTPHeaderField: "Content-Type")
                request.setValue("application/json", forHTTPHeaderField: "Accept")
                
                let task = URLSession.shared.dataTask(with: request){ data, response, error in
                    
                    if let logData = data{
                        do{
                            let parsingData = try JSONDecoder().decode(AuthenticationResponse.self, from: logData)
                            completion(parsingData)
                        }catch{
                            print(String(describing: error))
                        }
                    }
                }
                task.resume()
            }
        }
        
    }
    
}
