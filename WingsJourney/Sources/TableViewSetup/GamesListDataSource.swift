//
//  GamesListDataSource.swift
//  WingsJourney
//
//  Created by Guilherme Medeiros Mergulhão on 04/05/23.
//

import UIKit

class GamesListDataSource: NSObject, UITableViewDataSource{
    
    var data = [Game]()
    
    func populateDataSource(data: [Game]){
        self.data = data
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "UITableViewCell")
        cell.textLabel?.text = data[indexPath.row].name
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
            return "Games"
    }
}
