//
//  GamesListViewController.swift
//  WingsJourney
//
//  Created by Guilherme Medeiros Mergulhão on 04/05/23.
//

import UIKit

final class GamesListViewController: UIViewController{
        
    private var gamesListView: GamesListView? = nil
    private var gamesDataSource = GamesListDataSource()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buildView()
        callService(){ result in
            self.gamesDataSource.populateDataSource(data: result)
            DispatchQueue.main.async {
                if self.gamesListView != nil {
                    self.gamesListView?.gamesTableView.reloadData()
                }
            }
        }
    }
    
    private func buildView(){
        view = GamesListView(dataSource: gamesDataSource)
        gamesListView = view as? GamesListView
    }
    
    private func callService(completion: @escaping ([Game]) -> Void){
        if let url = URL(string: "https://6410ee0295656eab41c58fb8.mockapi.io/games"){
            let task = URLSession.shared.dataTask(with: url) { data, response, error in
                
                if let gamesData = data {
                    do{
                        let parsingData = try JSONDecoder().decode([Game].self, from: gamesData)
                        completion(parsingData)
                    } catch {
                        print(String(describing: error))
                    }
                }
                
            }
            task.resume()
        }
    }
}
