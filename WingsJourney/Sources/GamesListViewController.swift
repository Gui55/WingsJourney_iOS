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
    private var gamesAPI = GamesAPI()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buildView()
        gamesAPI.callService(){ result in
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
    
    
}
