//
//  GameTableCell.swift
//  WingsJourney
//
//  Created by Guilherme Medeiros Mergulhão on 08/05/23.
//

import UIKit

class GameTableCell: UITableViewCell{
    
    static let identifier = "GameCell"
    
    private let gameImage: UIImageView = {
        let iv = UIImageView()
        
        iv.translatesAutoresizingMaskIntoConstraints = false
        
        iv.contentMode = .scaleAspectFit
        iv.image = UIImage(systemName: "heart.fill")
        iv.tintColor = .label
        
        return iv
    }()
    
    private let gameName: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.font = .systemFont(ofSize: 24, weight: .medium)
        label.text = "Super Mega Hiper Ultra Blaster of a Game"
        label.textAlignment = .center
        label.numberOfLines = 2
        
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI(){
        self.contentView.addSubview(gameImage)
        self.contentView.addSubview(gameName)
                
        constraints()
    }
    
    private func constraints(){
        NSLayoutConstraint.activate([
            gameImage.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 20),
            gameImage.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            gameImage.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            
            gameImage.heightAnchor.constraint(equalToConstant: 250),
            gameImage.widthAnchor.constraint(equalToConstant: 250),
            
            gameName.topAnchor.constraint(equalTo: self.gameImage.bottomAnchor),
            gameName.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor),
            gameName.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            gameName.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            
            gameName.heightAnchor.constraint(equalToConstant: 90)
        ])
    }
    
    func configureName(name:String){
        self.gameName.text = name
    }
    
    func configureImage(request: URLRequest){
        self.gameImage.load(request: request)
    }
    
}

extension UIImageView {
    func load(request: URLRequest) {
        let task = URLSession.shared.dataTask(with: request){ data, response, error in
            if let imgData = data{
                DispatchQueue.main.async{
                    self.image = UIImage(data: imgData)
                }
            } else if let error = error{
                print(String(describing: error))
            }
        }
        task.resume()
    }
}
