//
//  GamesListView.swift
//  WingsJourney
//
//  Created by Guilherme Medeiros Mergulhão on 04/05/23.
//

import UIKit

class GamesListView: UIView{
    
    private lazy var dataSource: UITableViewDataSource? = nil
    
    init(dataSource: UITableViewDataSource){
        super.init(frame: .zero)
        self.dataSource = dataSource
        addSubview(gamesTableView)
        constraintTableView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var gamesTableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .insetGrouped)
        
        tableView.dataSource = dataSource
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorStyle = .none
        
        return tableView
    }()
    
    private func constraintTableView(){
        NSLayoutConstraint.activate([
            gamesTableView.topAnchor.constraint(equalTo: topAnchor),
            gamesTableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            gamesTableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            gamesTableView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
}
