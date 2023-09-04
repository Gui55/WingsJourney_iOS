//
//  GamesListViewController.swift
//  WingsJourney
//
//  Created by Guilherme Medeiros Mergulhão on 04/05/23.
//

import UIKit
import SwiftUI

final class GamesListViewController: UIViewController{
        
    private var gamesListView: GamesListView? = nil
    private var gamesDataSource = GamesListDataSource()
    private let viewModel = GamesListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buildView()
        setupObservations()
    }
    
    private func setupObservations(){
        viewModel.performFetchGames{ [weak self] value in
            self?.gamesDataSource.populateDataSource(data: value)
            DispatchQueue.main.async{
                self?.gamesListView?.gamesTableView.reloadData()
            }
        }
    }
    
    private func buildView(){
        view = GamesListView(dataSource: gamesDataSource)
        gamesListView = view as? GamesListView
    }
    
    
}

struct ViewControllerRepresentable: UIViewControllerRepresentable{
    
    typealias UIViewControllerType = GamesListViewController
    
    func makeUIViewController(context: Context) -> GamesListViewController {
        GamesListViewController()
    }
    
    func updateUIViewController(_ uiViewController: GamesListViewController, context: Context) {
        
    }
}

struct ViewController_Previews: PreviewProvider {
    static var previews: some View {
        ViewControllerRepresentable()
    }
}
