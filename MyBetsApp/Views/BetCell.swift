//
//  BetCell.swift
//  MyBetsApp
//
//  Created by Magdalena Witkowska on 30.01.2018.
//  Copyright © 2018 Jones, Oliver. All rights reserved.
//

import Foundation
import UIKit

class BetCell: UITableViewCell {
    
    @IBOutlet weak var teamLabel: UILabel!
    @IBOutlet weak var subeventLabel: UILabel!
    @IBOutlet weak var marketLabel: UILabel!
    @IBOutlet weak var channelImageView: UIImageView!
    @IBOutlet weak var stakeLabel: UILabel!
    @IBOutlet weak var oddsLabel: UILabel!
    @IBOutlet weak var returnsLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    

    func configureCell(bet: Bet) {
        if let details = bet.singleDetails {
            subeventLabel.text = details.subeventName ?? ""
            teamLabel.text = details.betName ?? ""
            marketLabel.text = details.marketName ?? ""
            oddsLabel.text = details.odds ?? ""
            
            if let broadcast = details.broadcast, let imageString = broadcast.channelLogo, let imageUrl = URL(string: imageString) {
                let session = URLSession.shared
                let task = session.dataTask(with: imageUrl) { (data, response, error) in
                    if error == nil {
                        let downloadedImage = UIImage(data: data!)
                        DispatchQueue.main.async {
                            self.channelImageView.image = downloadedImage
                        }
                    }
                }
                task.resume()
            }
        }
        
        stakeLabel.text = bet.totalBetStake ?? ""
        returnsLabel.text = bet.potentialWinnings ?? ""
        timeLabel.text = bet.timeElapsed ?? ""
    }
}
