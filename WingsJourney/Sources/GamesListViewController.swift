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
    }
    
    private func buildView(){
        view = GamesListView(dataSource: GamesListDataSource())
        gamesListView = view as? GamesListView
    }
    
}
