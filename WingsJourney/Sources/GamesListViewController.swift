//
//  GamesListViewController.swift
//  WingsJourney
//
//  Created by Guilherme Medeiros Mergulhão on 04/05/23.
//

import UIKit

final class GamesListViewController: UIViewController{
        
    private var gamesListView: GamesListView? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buildView()
        callService()
    }
    
    private func buildView(){
        view = GamesListView(dataSource: GamesListDataSource())
        gamesListView = view as? GamesListView
    }
    
    private func callService(){
        if let url = URL(string: "https://6410ee0295656eab41c58fb8.mockapi.io/games"){
            let task = URLSession.shared.dataTask(with: url) { data, response, error in
                
                if error == nil{
                    if let gamesData = data{
                        do{
                            let jsonObject = try JSONSerialization.jsonObject(with: gamesData, options: [])
                            print(jsonObject)
                        } catch{
                            print("erro")
                        }
                    }
                } else {
                    print(error?.localizedDescription as Any)
                }
                
            }
            task.resume()
        }
    }
}
