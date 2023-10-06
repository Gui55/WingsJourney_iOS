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
        return data.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "GameCell", for: indexPath) as! GameTableCell
        cell.configureName(name: data[indexPath.section].name)
        
        if let url = URL(string: data[indexPath.section].image) {
            var request = URLRequest(url: url)
            request.setValue(GlobalValues.getToken(), forHTTPHeaderField: "Authorization")
            cell.configureImage(request: request)
        }
        return cell
    }
}
