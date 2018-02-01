//
//  Bet.swift
//  MyBetsApp
//
//  Created by Magdalena Witkowska on 30.01.2018.
//  Copyright © 2018 Jones, Oliver. All rights reserved.
//

import Foundation

struct Bet: Codable {
    var totalBetStake: String?
    var potentialWinnings: String?
    var betDetails: [BetDetails]?
    
    var singleDetails: BetDetails? {
        if let firstDetails = betDetails?.first {
            return firstDetails
        }
        return nil
    }
    
    var timeElapsed: String?
}
