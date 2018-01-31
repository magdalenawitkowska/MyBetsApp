//
//  Bet.swift
//  MyBetsApp
//
//  Created by Magdalena Witkowska on 30.01.2018.
//  Copyright © 2018 Jones, Oliver. All rights reserved.
//

import Foundation

struct Bet: Codable {
    var channelLogo: String?
    var totalBetStake: String?
    var potentialWinnings: String?
    var betDetails: [BetDetails]?
    
    var singleDetails: BetDetails? {
        if let details = betDetails, details.count > 0 {
            return details[0]
        }
        return nil
    }
    
    var timeElapsed: String?
}
